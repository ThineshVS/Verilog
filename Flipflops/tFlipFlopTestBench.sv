module testb();
  reg clk, rst;
  reg t;
  wire q,qbar;
//tFlipFlop get inputs t, reset,clk Output q and q'
  task valueparse(bit ip);
    //we are creating a task since we are going to change the value of {t} constantly.
    //we are using task since we are using timing constructs
    @(posedge clk);//while the clk is at positive edge(0-to-1).
    t = ip;//This line is used to change the value of t as we instantiate the clock
    #1 $display("t= %b --> q= %b qbar= %b",t,q,qbar);//display the values for every cycle.
  endtask
  tflipflop tff(.clk(clk), .t(t),.rst(rst),.q(q),.qbar(qbar));//creating design instance.
  always #2 clk = ~clk; //negating clk value every 2ns
  initial begin
    clk = 0;rst = 0;//initiating clk values
    #3 rst=1;
    //setting reset equals 1 and doing some permutation&combinations of the inout values {t}.
    valueparse(1'b0);
    valueparse(1'b1);
    #5;
    //After 5ns we are deprecating the simulation.
    $finish;
  end       

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule : testb
