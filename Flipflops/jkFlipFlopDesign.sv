module jkflipflop(input j, input k, input clk, input rst, output reg q, output reg qbar);
  //srFlipFlop get inputs {j,k}, reset,clk Output q and q'
  always@(posedge clk)
  //Positive edge triggered flipflop
    if(!rst) q <= 0;
  //This is neg of rst (0)' = 1 then q is 0.
     else
      begin 
        case({s,r})
          2'b00: q <= q;
          2'b10: q <= 1'b1;
          2'b01: q <= 1'b0;
          2'b11: q <= ~q;
        endcase 
        assign qbar = ~q;
        
          // | J | K | Q (Next State) | Q' (Complement) |
          // |---|---|-----------------|------------------|
          // | 0 | 0 |      Q_prev     |      Q'_prev     |
          // | 0 | 1 |        0        |        1         |
          // | 1 | 0 |        1        |        0         |
          // | 1 | 1 |        Q'       |        Q         |

        #1 $display("Design output j= %b k= %b q= %b q=%b reset=%b", j, k,q,qbar,rst);
      end

endmodule
