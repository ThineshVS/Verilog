module testb();
  reg clk, rst;
  reg s,r;
  wire q,qbar;
//jkFlipFlop get inputs {s,r}, reset,clk Output q and q'
  task valueparse(bit [1:0] ip);
    //we are creating a task since we are going to change the value of {s.r} constantly.
    //we are using task since we are using timing constructs
    @(posedge clk);//while the clk is at positive edge(0-to-1).
    {s,r} = ip;//This line is used to change the value of s&r as we instantiate the clock
    #1 $display("s= %b r= %b --> q= %b qbar= %b",s,r,q,qbar);//display the values for every cycle.
  endtask
  jkflipflop jkff(.clk(clk), .s(s), .r(r),.rst(rst),.q(q),.qbar(qbar));//creating design instance.
  always #2 clk = ~clk; //negating clk value every 2ns
  initial begin
    clk = 0;rst = 0;//initiating clk values
    #3 rst=1;
    //setting reset equals 1 and doing some permutation&combinations of the inout values {s,r}.
    valueparse(2'b00);
    valueparse(2'b01);
    valueparse(2'b10);
    valueparse(2'b11);
    valueparse(2'b11);
    //This call again sets both J and K to 1, causing the output to toggle again. If the output q was 1 after the first call, it will change to 0, and if it was 0, it will change to 1.
    #5;
    //After 5ns we are deprecating the simulation.
    $finish;
  end       

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule : testb
