
module parameterized_RAM #(parameter DATA_WIDTH = 8,ADDR_WIDTH = 6)(
    input clk,   // clock signal
    input reset,  // reset signal
    input we,  // write enable
    input [ADDR_WIDTH-1:0]address,  // Address input
    input [DATA_WIDTH-1:0]data_in,  // data input
    output reg [DATA_WIDTH-1:0]data_ram_out);  // data ouput 
    
    reg[DATA_WIDTH-1:0] mem[(2**ADDR_WIDTH)-1:0];

    // always @(posedge clk,posedge reset)
    always @(posedge clk)
    begin
        if(reset) begin
            data_ram_out <=0;   // output is is zero (reset operation)
        end

       else  if(we)  begin
    
            mem[address] <= data_in;  // jo bhi data_in port pe hai usko mem main feed kar do  
        end    // write operation 

        else begin 
            data_ram_out <= mem[address] ;  // jo bhi data mem main hai usko output port main de do 
        end      // read operation 
    end
endmodule 



