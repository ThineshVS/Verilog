module dflipflop(input d, input clk, input rst, output reg q, output reg qbar);
  //dFlipFlop get inputs {d}, reset,clk Output q and q'
  always@(posedge clk)
  //Positive edge triggered flipflop
    if(!rst) q <= 0;
  //This is neg of rst (0)' = 1 then q is 0.
    else 
	begin
		q <= d;
    
    assign qbar = ~q;
        
        // | T | Q (Next State) | Q' (Complement) |
        // |---|-----------------|------------------|
        // | 0 |      Q_prev     |      Q'_prev     |
        // | 1 |      Q'         |        Q         |
  #1 $display("Design output d= %b q= %b qbar=%b reset=%b", d,q,qbar,rst);
 end

endmodule
