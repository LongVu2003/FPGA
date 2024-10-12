module MatrixOut 
    (   input clk, //clock
        input wr_en,    //write enable for port 0
        input [15:0] data_in,    //Input data to port 0.
        input [3:0] addr_in_0,  //address for port 0
        input port_en_0,    //enable port 0.
        output [15:0] data_out_0    //output data from port 0.
    );

//memory declaration.
reg [15:0] ram[0:7];

//writing to the RAM
always@(posedge clk)
begin
    if(port_en_0 == 1 && wr_en == 1)    //check enable signal and if write enable is ON
        ram[addr_in_0] <= data_in;
end

//always reading from the ram, irrespective of clock.
assign data_out_0 = port_en_0 ? ram[addr_in_0] : 'dZ;    

endmodule 