module tb;
  reg [7:0]a,b;
  reg [2:0]op;
  wire [7:0]result;
  wire zero,carry_out,overflow;
  
  ALU a1(.a(a),.b(b),.op(op),.result(result),.zero(zero),.carry_out(carry_out),.overflow(overflow));
  
  
  initial begin
    a = 8'd10; b = 8'd5; op = 3'b000; #10; // ADD -> 15
    a = 8'd10; b = 8'd5; op = 3'b001; #10; // SUB -> 5
    a = 8'd12; b = 8'd10; op = 3'b010; #10; // AND -> 8
    a = 8'd12; b = 8'd10; op = 3'b011; #10; // OR  -> 14
    a = 8'd12; b = 8'd10; op = 3'b100; #10; // XOR -> 6
    a = 8'd5;  b = 8'd5;  op = 3'b001; #10; // SUB -> 0, zero flag should assert
    $finish;
end
  
  initial begin
    $monitor("time=%0t a=%d b=%d op=%b result=%d zero=%b carry=%b overflow=%b",
              $time, a, b, op, result, zero, carry_out, overflow);
end
