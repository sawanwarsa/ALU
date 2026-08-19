module alu (
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] op,
    output reg [7:0] result,
    output zero,
    output carry_out,
    output overflow
);
  wire [8:0] sum  = {1'b0, a} + {1'b0, b};   //     9 bits: extra bit catches carry
  wire [8:0] diff = {1'b0, a} - {1'b0, b};
  wire [7:0] and_result = a & b;
  wire [7:0] or_result  = a | b;
  wire [7:0] xor_result = a ^ b;
  
  
  
  
  always@(*) begin
    case(op)
      3'b000: result=sum[7:0];
      3'b001: result=diff[7:0];
      3'b010: result=and_result;
      3'b011: result=or_result;
      3'b100: result=xor_result;
	  default: result=8'b0;
      
    endcase
  end
  
  
  assign zero = (result == 8'b0);
  assign carry_out = (op == 3'b000) ? sum[8]  :
                    (op == 3'b001) ? diff[8] : 1'b0;
  assign overflow = (op == 3'b000) ?
                    (a[7] == b[7]) && (result[7] != a[7]) : 1'b0;
  
endmodule
  

