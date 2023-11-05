// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:gfx_top:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module termprj_top_gfx_top_0_1 (
  i_EMU_MCLK,
  i_EMU_TMDSCLK,
  i_MRST_n,
  i_AXI_CPU_ADDR,
  o_AXI_CPU_DIN,
  i_AXI_CPU_DOUT,
  i_AXI_CPU_COMMAND,
  o_AXI_CPU_BUSY,
  o_AXI_CPU_VBLANK_IRQ,
  o_TMDS_p,
  o_TMDS_n,
  o_TMDSCLK_p,
  o_TMDSCLK_n
);

input wire i_EMU_MCLK;
input wire i_EMU_TMDSCLK;
input wire i_MRST_n;
input wire [14 : 0] i_AXI_CPU_ADDR;
output wire [15 : 0] o_AXI_CPU_DIN;
input wire [15 : 0] i_AXI_CPU_DOUT;
input wire [31 : 0] i_AXI_CPU_COMMAND;
output wire o_AXI_CPU_BUSY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME o_AXI_CPU_VBLANK_IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 o_AXI_CPU_VBLANK_IRQ INTERRUPT" *)
output wire o_AXI_CPU_VBLANK_IRQ;
output wire [2 : 0] o_TMDS_p;
output wire [2 : 0] o_TMDS_n;
output wire o_TMDSCLK_p;
output wire o_TMDSCLK_n;

  gfx_top inst (
    .i_EMU_MCLK(i_EMU_MCLK),
    .i_EMU_TMDSCLK(i_EMU_TMDSCLK),
    .i_MRST_n(i_MRST_n),
    .i_AXI_CPU_ADDR(i_AXI_CPU_ADDR),
    .o_AXI_CPU_DIN(o_AXI_CPU_DIN),
    .i_AXI_CPU_DOUT(i_AXI_CPU_DOUT),
    .i_AXI_CPU_COMMAND(i_AXI_CPU_COMMAND),
    .o_AXI_CPU_BUSY(o_AXI_CPU_BUSY),
    .o_AXI_CPU_VBLANK_IRQ(o_AXI_CPU_VBLANK_IRQ),
    .o_TMDS_p(o_TMDS_p),
    .o_TMDS_n(o_TMDS_n),
    .o_TMDSCLK_p(o_TMDSCLK_p),
    .o_TMDSCLK_n(o_TMDSCLK_n)
  );
endmodule
