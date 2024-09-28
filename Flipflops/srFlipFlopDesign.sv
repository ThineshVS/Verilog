module srflipflop(input s, input r, input clk, input rst, output reg q, output reg qbar);
  //srFlipFlop get inputs {s,r}, reset,clk Output q and q'
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
          2'b11: q <= 1'bx;
        endcase 
        assign qbar = ~q;
        
          // | S (Set) | R (Reset) | Q (Output) | Q' (Complement) |
          // |---------|-----------|------------|------------------|
          // |    0    |     0     |  Q_prev    |   Q'_prev        |
          // |    0    |     1     |     0      |        1         |
          // |    1    |     0     |     1      |        0         |
          // |    1    |     1     |  Invalid   |     Invalid      |

        #1 $display("Design output s= %b r= %b q= %b q=%b reset=%b", s, r,q,qbar,rst);
      end

endmodule
