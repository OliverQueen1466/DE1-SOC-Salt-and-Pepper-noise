source pin_assignment_DE1_SoC.tclsource pin_assignment_DE1_SoC.tcl`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: Xingzhou Tang Qiankun Zhou Zechen Xu
//////////////////////////////////////////////////////////////////////////////////

module medfilter2  
(
  CLK, 
  RSTn,
  Start_sig,
  Done_sig,
  Data_out
);
     
  input CLK;
  input RSTn;
  input Start_sig;
  output Done_sig;
  output [7:0] Data_out;


  /******************************************************************************/
  reg [7:0] rom_data; 
  wire [17:0] rom_addr; 

  wire [7:0] data_out0;       
  wire [7:0] data_out1;
  wire [7:0] data_out2;
  wire [7:0] data_out3;
  wire [7:0] data_out4;
  wire [7:0] data_out5;
  wire [7:0] data_out6;
  wire [7:0] data_out7;
  wire [7:0] data_out8;
  wire win_done_sig;
  wire [2:0] pixel;
 wire [9:0] column_addr_sig;
 wire [9:0] row_addr_sig;
 
 
  win3by3_gen win3by3_gen_inst (
  .CLK(CLK), 
  .RSTn(RSTn),
  .center_pix_sig(win_start_sig), 
  .cols(10'd512),   // the column numbers of the input image
  .rows(10'd512),   // the row numbers of the input image
  .rom_data_win(rom_data),    //input-from ; 
  .column_addr_sig(column_addr_sig),  
  .row_addr_sig(row_addr_sig),      
  .rom_addr_sig(rom_addr), 
  .data_out0(data_out0),    
  .data_out1(data_out1),
  .data_out2(data_out2),
  .data_out3(data_out3),
  .data_out4(data_out4),
  .data_out5(data_out5),
  .data_out6(data_out6),
  .data_out7(data_out7),
  .data_out8(data_out8),
  .win_data_done_sig(win_done_sig) //output to U4/U3
    );
  
  /******************************************************************************/ 
  VGADemo VGADemo_inst(
    .clk_25(clk),
    .pixel(pixel[2:0]),
    .hsync_out(win_done_sig),
    .vsync_out(win_done_sig),
); 
  counter_ctrl counter_ctrl_inst(
  .CLK(CLK),
  .RSTn(RSTn),
  .start_sig(Start_sig),  //input-from top 
  .nxt_pix_sig(win_done_sig),  //input-from 
  .cols(10'd512), 
  .column_addr_sig(column_addr_sig),  
  .row_addr_sig(row_addr_sig),     
  .pix_done_sig(win_start_sig)     
  );
  
/*****************************************************************************/
 
 wire medfilt_done_sig;
 wire [7:0] medfilt_data_wire;
 
 medfilter3by3 medfilter3by3_inst
(
  .CLK(CLK),
  .RSTn(RSTn), 
  .win_data_sig(win_done_sig),   
  .medfilt_done_sig(medfilt_done_sig),
  .data_in0(data_out0),       
  .data_in1(data_out1),
  .data_in2(data_out2),
  .data_in3(data_out3),
  .data_in4(data_out4),
  .data_in5(data_out5),
  .data_in6(data_out6),
  .data_in7(data_out7),
  .data_in8(data_out8),
  .medfilt_data_out(medfilt_data_wire)     //output-to top; 
); 

/*********************************************************************/
 wire Done_sig;
 wire [7:0] Data_out;
 assign Done_sig = medfilt_done_sig;
 assign Data_out = medfilt_data_wire;

 reg [7:0] test[0:262143];//stroe  data
 initial begin
    $readmemh("test.txt",test);//import data
 end
 always @(posedge CLK) begin
      rom_data<=test[rom_addr];
  end 
/**********************************************************************/
endmodule