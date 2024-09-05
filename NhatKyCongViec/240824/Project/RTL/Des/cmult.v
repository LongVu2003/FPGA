
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------
module cmult # (
    parameter Q = 8, 
    parameter N = 16
)
(
    input clk,
    input signed  [N-1:0] ar, ai,
    input signed  [N-1:0] br, bi,
    output signed [N-1:0] pr, pi
);

reg signed [N-1:0] ar_d, ar_dd, ar_ddd, ar_dddd;
reg signed [N-1:0] ai_d, ai_dd, ai_ddd, ai_dddd;
reg signed [N-1:0] br_d, br_dd, br_ddd, bi_d, bi_dd, bi_ddd;
reg signed [N:0] addcommon ;
reg signed [N:0] addr, addi ;
wire signed [N-1:0] mult0, multr, multi;
reg signed  [N-1:0] common, commonr1, commonr2;
reg signed  [N-1:0] pr_int, pi_int;

wire ovr_mult0, ovr_multr, ovr_multi; // Overflow flags for multipliers

// Pipeline stage 1: Input register
always @(posedge clk) begin
    ar_d <= ar;
    ar_dd <= ar_d;
    ai_d <= ai;
    ai_dd <= ai_d;
    br_d <= br;
    br_dd <= br_d;
    br_ddd <= br_dd;
    bi_d <= bi;
    bi_dd <= bi_d;
    bi_ddd <= bi_dd;
end

// Pipeline stage 2: Common factor multiplication
always @(posedge clk) begin
	addcommon <= ar_d - ai_d;
end
qmult #(.Q(Q), .N(N)) qmult_common (
    .i_multiplicand(addcommon), 
    .i_multiplier(bi_dd), 
    .o_result(mult0),
    .ovr(ovr_mult0)
);

always @(posedge clk) begin
    common <= mult0;
end

// Pipeline stage 3: Real product calculation
always @(posedge clk) begin
    ar_ddd <= ar_dd;
	ar_dddd <= ar_ddd;
end

always @(posedge clk) begin
	addr <= br_ddd - bi_ddd;
end

qmult #(.Q(Q), .N(N)) qmult_real (
    .i_multiplicand(addr), 
    .i_multiplier(ar_dddd), 
    .o_result(multr),
    .ovr(ovr_multr)
);

always @(posedge clk) begin
    commonr1 <= common;
    pr_int <= multr + commonr1; 
end

// Pipeline stage 4: Imaginary product calculation

always @(posedge clk)
begin
	ai_ddd <= ai_dd;
	ai_dddd <= ai_ddd;
end

always @(posedge clk) begin
	addi <= br_ddd + bi_ddd;
end

qmult #(.Q(Q), .N(N)) qmult_imag (
    .i_multiplicand(addi), 
    .i_multiplier(ai_dddd), 
    .o_result(multi),
    .ovr(ovr_multi)
);

always @(posedge clk) begin
    commonr2 <= common;
    pi_int <= multi + commonr2; 
end

// Output assignment
assign pr = pr_int;
assign pi = pi_int;

endmodule // cmult