module testb();
  reg clk, rst;
  reg d;
  wire q,qbar;
//dFlipFlop get inputs d, reset,clk Output q and q'
  task valueparse(bit ip);
    //we are creating a task since we are going to change the value of {d} constantly.
    //we are using task since we are using timing constructs
    @(posedge clk);//while the clk is at positive edge(0-to-1).
    d = ip;//This line is used to change the value of t as we instantiate the clock
    #1 $display("d= %b --> q= %b qbar= %b",d,q,qbar);//display the values for every cycle.
  endtask
  dflipflop dff(.clk(clk), .d(d),.rst(rst),.q(q),.qbar(qbar));//creating design instance.
  always #2 clk = ~clk; //negating clk value every 2ns
  initial begin
    clk = 0;rst = 0;//initiating clk values
    #3 rst=1;
    //setting reset equals 1 and doing some permutation&combinations of the inout values {d}.
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
