`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Fudan University
// Engineer: Xingzhou Tang Qiankun Zhou Zechen Xu
//////////////////////////////////////////////////////////////////////////////////
module counter_ctrl(
  CLK,
  RSTn,
  start_sig,  //input-from top
  nxt_pix_sig,     //input-from --start next center point pixel
  cols,                          
  column_addr_sig,  
  row_addr_sig,    
  pix_done_sig  
    );
     
  input CLK;
  input RSTn;
  input start_sig;
  input nxt_pix_sig;
  input [9:0] cols;
  
  output pix_done_sig;  
  output [9:0] column_addr_sig;    
  output [9:0] row_addr_sig;   
  
 /***********************************************************************************************/

  reg isCtrlDone;
  //reg isWinStart;
  reg [17:0] imk;   //The k-th pixel of the image
  reg [9:0] row_addr;  // The row of the centeral pixel
  reg [9:0] column_addr;   // The column of the centeral pixel
  
  reg start_sig_d;
  
  wire start_sig_rising_vld;
  
   always @ (posedge CLK or negedge RSTn)  
    if (!RSTn)
        start_sig_d <= 0;
     else 
        start_sig_d <= start_sig;
  
  assign start_sig_rising_vld = start_sig & (~start_sig_d);
  
  always @ (posedge CLK or negedge RSTn) 
    if (!RSTn)
       begin  
        imk <= 18'b0; 
        column_addr <= 10'b0; 
        row_addr <= 10'b0;
        isCtrlDone <= 1'b0;    
        end
     else if (start_sig_rising_vld)
       begin  
        imk <= 18'b1; 
        column_addr <= 10'b1; 
        row_addr <= 10'b1;
        isCtrlDone <= 1'b1;    
        end    
     else if ( nxt_pix_sig )
       begin  
          imk <= imk + 1'b1;
          row_addr <= imk / cols + 1;   
          column_addr <= imk % cols + 1;   
        isCtrlDone <= 1'b1; 
        end
     else isCtrlDone <= 1'b0;    
          
/*****************************************************************************************/
  
  assign row_addr_sig = row_addr;
  assign column_addr_sig = column_addr;
  assign pix_done_sig = isCtrlDone;
  
/*****************************************************************************************/
endmodule