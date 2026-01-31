`timescale 1ns/1ps

module tb_eeprom_top;

  reg clk;
  reg rst;
  reg newd;
  reg wr;
  reg [7:0] wdata;
  reg [6:0] addr;

  wire scl;
  wire sda;
  wire [7:0] rdata;
  wire done;

  // DUT
  eeprom_top dut (
    .clk(clk),
    .rst(rst),
    .newd(newd),
    .ack(1'b1),     // EEPROM model always ACKs
    .wr(wr),
    .scl(scl),
    .sda(sda),
    .wdata(wdata),
    .addr(addr),
    .rdata(rdata),
    .done(done)
  );

  // EEPROM MODEL
  i2c_eeprom_model eeprom (
    .scl(scl),
    .sda(sda)
  );

  // Clock: 100 MHz
  always #5 clk = ~clk;

  initial begin
    clk   = 0;
    rst   = 1;
    newd  = 0;
    wr    = 0;
    wdata = 8'h00;
    addr  = 7'h50;

    #50 rst = 0;

    // WRITE
    wr    = 1;
    wdata = 8'hAA;
    newd  = 1;
    #20 newd = 0;

    wait(done);
    $display("WRITE DONE");

    #200;

    // READ
    wr   = 0;
    newd = 1;
    #20 newd = 0;

    wait(done);
    $display("READ DONE : %h", rdata);

    #200;
    $stop;
  end

endmodule
