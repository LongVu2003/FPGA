//--------------------------------------------------------------------------------------------------------
// Module  : tb_fxp_mul_div_pipe
// Type    : simulation, top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: testbench for fxp_mul_pipe and fxp_div_pipe
//--------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module tb_fxp_div_pipe ();

//initial $dumpvars(0, tb_fxp_mul_div_pipe);


localparam WIIA = 8;
localparam WIFA = 8;
localparam WIIB = 8;
localparam WIFB = 8;
localparam WOI  = 8;
localparam WOF  = 8;


reg rstn = 1'b0;
reg clk  = 1'b1;
always #(10000) clk = ~clk;   // 50MHz
initial begin repeat(4) @(posedge clk); rstn<=1'b1; end


reg  [WIIA+WIFA-1:0] ina = 0;
reg  [WIIB+WIFB-1:0] inb = 0;
wire [ WOI+ WOF-1:0] odiv;
wire                 odivo;


fxp_div_pipe # (
    .WIIA     ( WIIA     ),
    .WIFA     ( WIFA     ),
    .WIIB     ( WIIB     ),
    .WIFB     ( WIFB     ),
    .WOI      ( WOI      ),
    .WOF      ( WOF      ),
    .ROUND    ( 1        )
) fxp_div_pipe_i (
    .rstn     ( rstn     ),
    .clk      ( clk      ),
    .dividend ( ina      ),
    .divisor  ( inb      ),
    .out      ( odiv     ),
    .overflow ( odivo    )
);


task test;
    input [WIIA+WIFA-1:0] _ina;
    input [WIIB+WIFB-1:0] _inb;
begin
    @ (posedge clk);
    ina <= _ina;
    inb <= _inb;
end
endtask


reg        [31:0] cyclecnt = 0;
always @ (posedge clk)
    if(rstn) begin
        cyclecnt <= cyclecnt + 1;
        $display("cycle%3d   a=%16f   b=%16f  a/b=%16f   odiv:%16f %s" , cyclecnt,
            (($signed( ina)*1.0)/(1<<WIFA))                                  ,
            (($signed( inb)*1.0)/(1<<WIFB))                                  ,
            (($signed( ina)*1.0)/(1<<WIFA)) / (($signed(inb)*1.0)/(1<<WIFB)) ,
            (($signed(odiv)*1.0)/(1<<WOF ))                                  ,
            odivo ? "(o)" : "   "                                            
        );
    end


initial begin
    while(~rstn) @ (posedge clk);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
    test('h0080, 'h0180);
    test('hfe80, 'hfc80);
    test('h0080, 'h0080);
    test('hfc80, 'hfc80);
    test('hfe80, 'h0180);
repeat(WOI+WOF+8)
    test('h0000, 'h0000);
    $stop();
end

endmodule