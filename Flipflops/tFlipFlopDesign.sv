module tflipflop(input t, input clk, input rst, output reg q, output reg qbar);
  //srFlipFlop get inputs {t}, reset,clk Output q and q'
  always@(posedge clk)
  //Positive edge triggered flipflop
    if(!rst) q <= 0;
  //This is neg of rst (0)' = 1 then q is 0.
     else
      begin 
        case({t})
          1'b0: q <= q;
          1'b1: q <= ~q;
        endcase 
        assign qbar = ~q;
        
        // | T | Q (Next State) | Q' (Complement) |
        // |---|-----------------|------------------|
        // | 0 |      Q_prev     |      Q'_prev     |
        // | 1 |      Q'         |        Q         |

        #1 $display("Design output t= %b q= %b q=%b reset=%b", t,q,qbar,rst);
      end

endmodule
