// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Nov 28 13:34:38 2022
// Host        : Ika-musume running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ termprj_top_rotaryio_0_0_sim_netlist.v
// Design      : termprj_top_rotaryio_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rotaryio_v1_0
   (axi_rvalid_reg,
    S_AXI_ARREADY,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_aclk,
    i_ROTARY_B,
    i_ROTARY_A,
    i_PSW,
    s00_axi_araddr,
    s00_axi_awaddr,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_bready,
    s00_axi_rready);
  output axi_rvalid_reg;
  output S_AXI_ARREADY;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_aclk;
  input i_ROTARY_B;
  input i_ROTARY_A;
  input i_PSW;
  input [1:0]s00_axi_araddr;
  input [1:0]s00_axi_awaddr;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire axi_rvalid_reg;
  wire i_PSW;
  wire i_ROTARY_A;
  wire i_ROTARY_B;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rotaryio_v1_0_S00_AXI rotaryio_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .i_PSW(i_PSW),
        .i_ROTARY_A(i_ROTARY_A),
        .i_ROTARY_B(i_ROTARY_B),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rotaryio_v1_0_S00_AXI
   (axi_rvalid_reg_0,
    S_AXI_ARREADY,
    S_AXI_WREADY,
    S_AXI_AWREADY,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_aclk,
    i_ROTARY_B,
    i_ROTARY_A,
    i_PSW,
    s00_axi_araddr,
    s00_axi_awaddr,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_bready,
    s00_axi_rready);
  output axi_rvalid_reg_0;
  output S_AXI_ARREADY;
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_aclk;
  input i_ROTARY_B;
  input i_ROTARY_A;
  input i_PSW;
  input [1:0]s00_axi_araddr;
  input [1:0]s00_axi_awaddr;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire [3:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready0;
  wire cnt_dlyd;
  wire cnt_i_1_n_0;
  wire cnt_reg_n_0;
  wire \delta_cntr[0]_i_1_n_0 ;
  wire \delta_cntr[0]_i_2_n_0 ;
  wire \delta_cntr[0]_i_4_n_0 ;
  wire \delta_cntr[0]_i_5_n_0 ;
  wire \delta_cntr[0]_i_6_n_0 ;
  wire \delta_cntr[12]_i_2_n_0 ;
  wire \delta_cntr[12]_i_3_n_0 ;
  wire \delta_cntr[12]_i_4_n_0 ;
  wire \delta_cntr[12]_i_5_n_0 ;
  wire \delta_cntr[16]_i_2_n_0 ;
  wire \delta_cntr[16]_i_3_n_0 ;
  wire \delta_cntr[16]_i_4_n_0 ;
  wire \delta_cntr[16]_i_5_n_0 ;
  wire \delta_cntr[20]_i_2_n_0 ;
  wire \delta_cntr[20]_i_3_n_0 ;
  wire \delta_cntr[20]_i_4_n_0 ;
  wire \delta_cntr[20]_i_5_n_0 ;
  wire \delta_cntr[24]_i_2_n_0 ;
  wire \delta_cntr[24]_i_3_n_0 ;
  wire \delta_cntr[24]_i_4_n_0 ;
  wire \delta_cntr[24]_i_5_n_0 ;
  wire \delta_cntr[28]_i_2_n_0 ;
  wire \delta_cntr[28]_i_3_n_0 ;
  wire \delta_cntr[28]_i_4_n_0 ;
  wire \delta_cntr[28]_i_5_n_0 ;
  wire \delta_cntr[4]_i_2_n_0 ;
  wire \delta_cntr[4]_i_3_n_0 ;
  wire \delta_cntr[4]_i_4_n_0 ;
  wire \delta_cntr[4]_i_5_n_0 ;
  wire \delta_cntr[8]_i_2_n_0 ;
  wire \delta_cntr[8]_i_3_n_0 ;
  wire \delta_cntr[8]_i_4_n_0 ;
  wire \delta_cntr[8]_i_5_n_0 ;
  wire [31:0]delta_cntr_reg;
  wire \delta_cntr_reg[0]_i_3_n_0 ;
  wire \delta_cntr_reg[0]_i_3_n_1 ;
  wire \delta_cntr_reg[0]_i_3_n_2 ;
  wire \delta_cntr_reg[0]_i_3_n_3 ;
  wire \delta_cntr_reg[0]_i_3_n_4 ;
  wire \delta_cntr_reg[0]_i_3_n_5 ;
  wire \delta_cntr_reg[0]_i_3_n_6 ;
  wire \delta_cntr_reg[0]_i_3_n_7 ;
  wire \delta_cntr_reg[12]_i_1_n_0 ;
  wire \delta_cntr_reg[12]_i_1_n_1 ;
  wire \delta_cntr_reg[12]_i_1_n_2 ;
  wire \delta_cntr_reg[12]_i_1_n_3 ;
  wire \delta_cntr_reg[12]_i_1_n_4 ;
  wire \delta_cntr_reg[12]_i_1_n_5 ;
  wire \delta_cntr_reg[12]_i_1_n_6 ;
  wire \delta_cntr_reg[12]_i_1_n_7 ;
  wire \delta_cntr_reg[16]_i_1_n_0 ;
  wire \delta_cntr_reg[16]_i_1_n_1 ;
  wire \delta_cntr_reg[16]_i_1_n_2 ;
  wire \delta_cntr_reg[16]_i_1_n_3 ;
  wire \delta_cntr_reg[16]_i_1_n_4 ;
  wire \delta_cntr_reg[16]_i_1_n_5 ;
  wire \delta_cntr_reg[16]_i_1_n_6 ;
  wire \delta_cntr_reg[16]_i_1_n_7 ;
  wire \delta_cntr_reg[20]_i_1_n_0 ;
  wire \delta_cntr_reg[20]_i_1_n_1 ;
  wire \delta_cntr_reg[20]_i_1_n_2 ;
  wire \delta_cntr_reg[20]_i_1_n_3 ;
  wire \delta_cntr_reg[20]_i_1_n_4 ;
  wire \delta_cntr_reg[20]_i_1_n_5 ;
  wire \delta_cntr_reg[20]_i_1_n_6 ;
  wire \delta_cntr_reg[20]_i_1_n_7 ;
  wire \delta_cntr_reg[24]_i_1_n_0 ;
  wire \delta_cntr_reg[24]_i_1_n_1 ;
  wire \delta_cntr_reg[24]_i_1_n_2 ;
  wire \delta_cntr_reg[24]_i_1_n_3 ;
  wire \delta_cntr_reg[24]_i_1_n_4 ;
  wire \delta_cntr_reg[24]_i_1_n_5 ;
  wire \delta_cntr_reg[24]_i_1_n_6 ;
  wire \delta_cntr_reg[24]_i_1_n_7 ;
  wire \delta_cntr_reg[28]_i_1_n_1 ;
  wire \delta_cntr_reg[28]_i_1_n_2 ;
  wire \delta_cntr_reg[28]_i_1_n_3 ;
  wire \delta_cntr_reg[28]_i_1_n_4 ;
  wire \delta_cntr_reg[28]_i_1_n_5 ;
  wire \delta_cntr_reg[28]_i_1_n_6 ;
  wire \delta_cntr_reg[28]_i_1_n_7 ;
  wire \delta_cntr_reg[4]_i_1_n_0 ;
  wire \delta_cntr_reg[4]_i_1_n_1 ;
  wire \delta_cntr_reg[4]_i_1_n_2 ;
  wire \delta_cntr_reg[4]_i_1_n_3 ;
  wire \delta_cntr_reg[4]_i_1_n_4 ;
  wire \delta_cntr_reg[4]_i_1_n_5 ;
  wire \delta_cntr_reg[4]_i_1_n_6 ;
  wire \delta_cntr_reg[4]_i_1_n_7 ;
  wire \delta_cntr_reg[8]_i_1_n_0 ;
  wire \delta_cntr_reg[8]_i_1_n_1 ;
  wire \delta_cntr_reg[8]_i_1_n_2 ;
  wire \delta_cntr_reg[8]_i_1_n_3 ;
  wire \delta_cntr_reg[8]_i_1_n_4 ;
  wire \delta_cntr_reg[8]_i_1_n_5 ;
  wire \delta_cntr_reg[8]_i_1_n_6 ;
  wire \delta_cntr_reg[8]_i_1_n_7 ;
  wire direction;
  wire direction_i_1_n_0;
  wire i_PSW;
  wire i_ROTARY_A;
  wire i_ROTARY_B;
  wire [31:7]p_1_in;
  wire [2:0]psw_syncchain;
  wire [31:0]reg_data_out;
  wire [1:0]rotary;
  wire [1:0]rotary_a_syncchain;
  wire [1:0]rotary_b_syncchain;
  wire [1:0]rotary_state;
  wire \rotary_state[0]_i_1_n_0 ;
  wire \rotary_state[1]_i_1_n_0 ;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__2;
  wire [3:3]\NLW_delta_cntr_reg[28]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hBFFF8CCC8CCC8CCC)) 
    aw_en_i_1
       (.I0(S_AXI_AWREADY),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(S_AXI_AWREADY),
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(S_AXI_AWREADY),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_awready_i_2
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(S_AXI_AWREADY),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_WREADY),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg3[0]),
        .I1(psw_syncchain[2]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[0]),
        .I4(axi_araddr[3]),
        .I5(delta_cntr_reg[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg3[10]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[10]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[10]),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg3[11]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[11]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[11]),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg3[12]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[12]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[12]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg3[13]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[13]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[13]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg3[14]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[14]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[14]),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg3[15]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[15]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[15]),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg3[16]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[16]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[16]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg3[17]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[17]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[17]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg3[18]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[18]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[18]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg3[19]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[19]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[19]),
        .O(reg_data_out[19]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg3[1]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[1]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[1]),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg3[20]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[20]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[20]),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg3[21]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[21]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[21]),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg3[22]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[22]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[22]),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg3[23]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[23]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[23]),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg3[24]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[24]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg3[25]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[25]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[25]),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg3[26]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[26]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[26]),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg3[27]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[27]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[27]),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg3[28]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[28]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[28]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg3[29]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[29]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[29]),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg3[2]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[2]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[2]),
        .O(reg_data_out[2]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg3[30]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[30]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[30]),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg3[31]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[31]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[31]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg3[3]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[3]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[3]),
        .O(reg_data_out[3]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg3[4]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[4]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[4]),
        .O(reg_data_out[4]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg3[5]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[5]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[5]),
        .O(reg_data_out[5]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg3[6]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[6]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[6]),
        .O(reg_data_out[6]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg3[7]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[7]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[7]),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg3[8]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[8]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[8]),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg3[9]),
        .I1(axi_araddr[2]),
        .I2(slv_reg2[9]),
        .I3(axi_araddr[3]),
        .I4(delta_cntr_reg[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .I2(axi_rvalid_reg_0),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(S_AXI_WREADY),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(axi_awready_i_1_n_0));
  FDRE cnt_dlyd_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(cnt_reg_n_0),
        .Q(cnt_dlyd),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF7DFAAAA40000080)) 
    cnt_i_1
       (.I0(rotary_state[1]),
        .I1(rotary[1]),
        .I2(rotary[0]),
        .I3(direction),
        .I4(rotary_state[0]),
        .I5(cnt_reg_n_0),
        .O(cnt_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cnt_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(cnt_i_1_n_0),
        .Q(cnt_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h20FF)) 
    \delta_cntr[0]_i_1 
       (.I0(s00_axi_arvalid),
        .I1(axi_rvalid_reg_0),
        .I2(S_AXI_ARREADY),
        .I3(s00_axi_aresetn),
        .O(\delta_cntr[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \delta_cntr[0]_i_2 
       (.I0(cnt_reg_n_0),
        .I1(cnt_dlyd),
        .O(\delta_cntr[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[0]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[3]),
        .O(\delta_cntr[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[0]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[2]),
        .O(\delta_cntr[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[0]_i_6 
       (.I0(direction),
        .I1(delta_cntr_reg[1]),
        .O(\delta_cntr[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[12]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[15]),
        .O(\delta_cntr[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[12]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[14]),
        .O(\delta_cntr[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[12]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[13]),
        .O(\delta_cntr[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[12]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[12]),
        .O(\delta_cntr[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[16]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[19]),
        .O(\delta_cntr[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[16]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[18]),
        .O(\delta_cntr[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[16]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[17]),
        .O(\delta_cntr[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[16]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[16]),
        .O(\delta_cntr[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[20]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[23]),
        .O(\delta_cntr[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[20]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[22]),
        .O(\delta_cntr[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[20]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[21]),
        .O(\delta_cntr[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[20]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[20]),
        .O(\delta_cntr[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[24]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[27]),
        .O(\delta_cntr[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[24]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[26]),
        .O(\delta_cntr[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[24]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[25]),
        .O(\delta_cntr[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[24]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[24]),
        .O(\delta_cntr[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[28]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[31]),
        .O(\delta_cntr[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[28]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[30]),
        .O(\delta_cntr[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[28]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[29]),
        .O(\delta_cntr[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[28]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[28]),
        .O(\delta_cntr[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[4]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[7]),
        .O(\delta_cntr[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[4]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[6]),
        .O(\delta_cntr[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[4]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[5]),
        .O(\delta_cntr[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[4]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[4]),
        .O(\delta_cntr[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[8]_i_2 
       (.I0(direction),
        .I1(delta_cntr_reg[11]),
        .O(\delta_cntr[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[8]_i_3 
       (.I0(direction),
        .I1(delta_cntr_reg[10]),
        .O(\delta_cntr[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[8]_i_4 
       (.I0(direction),
        .I1(delta_cntr_reg[9]),
        .O(\delta_cntr[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \delta_cntr[8]_i_5 
       (.I0(direction),
        .I1(delta_cntr_reg[8]),
        .O(\delta_cntr[8]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[0]_i_3_n_7 ),
        .Q(delta_cntr_reg[0]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\delta_cntr_reg[0]_i_3_n_0 ,\delta_cntr_reg[0]_i_3_n_1 ,\delta_cntr_reg[0]_i_3_n_2 ,\delta_cntr_reg[0]_i_3_n_3 }),
        .CYINIT(1'b1),
        .DI({direction,direction,direction,1'b0}),
        .O({\delta_cntr_reg[0]_i_3_n_4 ,\delta_cntr_reg[0]_i_3_n_5 ,\delta_cntr_reg[0]_i_3_n_6 ,\delta_cntr_reg[0]_i_3_n_7 }),
        .S({\delta_cntr[0]_i_4_n_0 ,\delta_cntr[0]_i_5_n_0 ,\delta_cntr[0]_i_6_n_0 ,delta_cntr_reg[0]}));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[8]_i_1_n_5 ),
        .Q(delta_cntr_reg[10]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[8]_i_1_n_4 ),
        .Q(delta_cntr_reg[11]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[12]_i_1_n_7 ),
        .Q(delta_cntr_reg[12]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[12]_i_1 
       (.CI(\delta_cntr_reg[8]_i_1_n_0 ),
        .CO({\delta_cntr_reg[12]_i_1_n_0 ,\delta_cntr_reg[12]_i_1_n_1 ,\delta_cntr_reg[12]_i_1_n_2 ,\delta_cntr_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[12]_i_1_n_4 ,\delta_cntr_reg[12]_i_1_n_5 ,\delta_cntr_reg[12]_i_1_n_6 ,\delta_cntr_reg[12]_i_1_n_7 }),
        .S({\delta_cntr[12]_i_2_n_0 ,\delta_cntr[12]_i_3_n_0 ,\delta_cntr[12]_i_4_n_0 ,\delta_cntr[12]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[12]_i_1_n_6 ),
        .Q(delta_cntr_reg[13]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[12]_i_1_n_5 ),
        .Q(delta_cntr_reg[14]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[12]_i_1_n_4 ),
        .Q(delta_cntr_reg[15]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[16]_i_1_n_7 ),
        .Q(delta_cntr_reg[16]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[16]_i_1 
       (.CI(\delta_cntr_reg[12]_i_1_n_0 ),
        .CO({\delta_cntr_reg[16]_i_1_n_0 ,\delta_cntr_reg[16]_i_1_n_1 ,\delta_cntr_reg[16]_i_1_n_2 ,\delta_cntr_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[16]_i_1_n_4 ,\delta_cntr_reg[16]_i_1_n_5 ,\delta_cntr_reg[16]_i_1_n_6 ,\delta_cntr_reg[16]_i_1_n_7 }),
        .S({\delta_cntr[16]_i_2_n_0 ,\delta_cntr[16]_i_3_n_0 ,\delta_cntr[16]_i_4_n_0 ,\delta_cntr[16]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[16]_i_1_n_6 ),
        .Q(delta_cntr_reg[17]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[16]_i_1_n_5 ),
        .Q(delta_cntr_reg[18]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[16]_i_1_n_4 ),
        .Q(delta_cntr_reg[19]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[0]_i_3_n_6 ),
        .Q(delta_cntr_reg[1]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[20]_i_1_n_7 ),
        .Q(delta_cntr_reg[20]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[20]_i_1 
       (.CI(\delta_cntr_reg[16]_i_1_n_0 ),
        .CO({\delta_cntr_reg[20]_i_1_n_0 ,\delta_cntr_reg[20]_i_1_n_1 ,\delta_cntr_reg[20]_i_1_n_2 ,\delta_cntr_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[20]_i_1_n_4 ,\delta_cntr_reg[20]_i_1_n_5 ,\delta_cntr_reg[20]_i_1_n_6 ,\delta_cntr_reg[20]_i_1_n_7 }),
        .S({\delta_cntr[20]_i_2_n_0 ,\delta_cntr[20]_i_3_n_0 ,\delta_cntr[20]_i_4_n_0 ,\delta_cntr[20]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[20]_i_1_n_6 ),
        .Q(delta_cntr_reg[21]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[20]_i_1_n_5 ),
        .Q(delta_cntr_reg[22]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[20]_i_1_n_4 ),
        .Q(delta_cntr_reg[23]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[24]_i_1_n_7 ),
        .Q(delta_cntr_reg[24]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[24]_i_1 
       (.CI(\delta_cntr_reg[20]_i_1_n_0 ),
        .CO({\delta_cntr_reg[24]_i_1_n_0 ,\delta_cntr_reg[24]_i_1_n_1 ,\delta_cntr_reg[24]_i_1_n_2 ,\delta_cntr_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[24]_i_1_n_4 ,\delta_cntr_reg[24]_i_1_n_5 ,\delta_cntr_reg[24]_i_1_n_6 ,\delta_cntr_reg[24]_i_1_n_7 }),
        .S({\delta_cntr[24]_i_2_n_0 ,\delta_cntr[24]_i_3_n_0 ,\delta_cntr[24]_i_4_n_0 ,\delta_cntr[24]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[24]_i_1_n_6 ),
        .Q(delta_cntr_reg[25]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[24]_i_1_n_5 ),
        .Q(delta_cntr_reg[26]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[24]_i_1_n_4 ),
        .Q(delta_cntr_reg[27]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[28]_i_1_n_7 ),
        .Q(delta_cntr_reg[28]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[28]_i_1 
       (.CI(\delta_cntr_reg[24]_i_1_n_0 ),
        .CO({\NLW_delta_cntr_reg[28]_i_1_CO_UNCONNECTED [3],\delta_cntr_reg[28]_i_1_n_1 ,\delta_cntr_reg[28]_i_1_n_2 ,\delta_cntr_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,direction,direction,direction}),
        .O({\delta_cntr_reg[28]_i_1_n_4 ,\delta_cntr_reg[28]_i_1_n_5 ,\delta_cntr_reg[28]_i_1_n_6 ,\delta_cntr_reg[28]_i_1_n_7 }),
        .S({\delta_cntr[28]_i_2_n_0 ,\delta_cntr[28]_i_3_n_0 ,\delta_cntr[28]_i_4_n_0 ,\delta_cntr[28]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[28]_i_1_n_6 ),
        .Q(delta_cntr_reg[29]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[0]_i_3_n_5 ),
        .Q(delta_cntr_reg[2]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[28]_i_1_n_5 ),
        .Q(delta_cntr_reg[30]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[28]_i_1_n_4 ),
        .Q(delta_cntr_reg[31]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[0]_i_3_n_4 ),
        .Q(delta_cntr_reg[3]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[4]_i_1_n_7 ),
        .Q(delta_cntr_reg[4]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[4]_i_1 
       (.CI(\delta_cntr_reg[0]_i_3_n_0 ),
        .CO({\delta_cntr_reg[4]_i_1_n_0 ,\delta_cntr_reg[4]_i_1_n_1 ,\delta_cntr_reg[4]_i_1_n_2 ,\delta_cntr_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[4]_i_1_n_4 ,\delta_cntr_reg[4]_i_1_n_5 ,\delta_cntr_reg[4]_i_1_n_6 ,\delta_cntr_reg[4]_i_1_n_7 }),
        .S({\delta_cntr[4]_i_2_n_0 ,\delta_cntr[4]_i_3_n_0 ,\delta_cntr[4]_i_4_n_0 ,\delta_cntr[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[4]_i_1_n_6 ),
        .Q(delta_cntr_reg[5]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[4]_i_1_n_5 ),
        .Q(delta_cntr_reg[6]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[4]_i_1_n_4 ),
        .Q(delta_cntr_reg[7]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[8]_i_1_n_7 ),
        .Q(delta_cntr_reg[8]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  CARRY4 \delta_cntr_reg[8]_i_1 
       (.CI(\delta_cntr_reg[4]_i_1_n_0 ),
        .CO({\delta_cntr_reg[8]_i_1_n_0 ,\delta_cntr_reg[8]_i_1_n_1 ,\delta_cntr_reg[8]_i_1_n_2 ,\delta_cntr_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({direction,direction,direction,direction}),
        .O({\delta_cntr_reg[8]_i_1_n_4 ,\delta_cntr_reg[8]_i_1_n_5 ,\delta_cntr_reg[8]_i_1_n_6 ,\delta_cntr_reg[8]_i_1_n_7 }),
        .S({\delta_cntr[8]_i_2_n_0 ,\delta_cntr[8]_i_3_n_0 ,\delta_cntr[8]_i_4_n_0 ,\delta_cntr[8]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \delta_cntr_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\delta_cntr[0]_i_2_n_0 ),
        .D(\delta_cntr_reg[8]_i_1_n_6 ),
        .Q(delta_cntr_reg[9]),
        .R(\delta_cntr[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAABA8AA)) 
    direction_i_1
       (.I0(direction),
        .I1(rotary_state[1]),
        .I2(rotary_state[0]),
        .I3(rotary[1]),
        .I4(rotary[0]),
        .O(direction_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    direction_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(direction_i_1_n_0),
        .Q(direction),
        .R(1'b0));
  FDRE \psw_syncchain_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_PSW),
        .Q(psw_syncchain[0]),
        .R(1'b0));
  FDRE \psw_syncchain_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(psw_syncchain[0]),
        .Q(psw_syncchain[1]),
        .R(1'b0));
  FDRE \psw_syncchain_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(psw_syncchain[1]),
        .Q(psw_syncchain[2]),
        .R(1'b0));
  FDRE \rotary_a_syncchain_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_ROTARY_A),
        .Q(rotary_a_syncchain[0]),
        .R(1'b0));
  FDRE \rotary_a_syncchain_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_a_syncchain[0]),
        .Q(rotary_a_syncchain[1]),
        .R(1'b0));
  FDRE \rotary_a_syncchain_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_a_syncchain[1]),
        .Q(rotary[1]),
        .R(1'b0));
  FDRE \rotary_b_syncchain_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(i_ROTARY_B),
        .Q(rotary_b_syncchain[0]),
        .R(1'b0));
  FDRE \rotary_b_syncchain_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_b_syncchain[0]),
        .Q(rotary_b_syncchain[1]),
        .R(1'b0));
  FDRE \rotary_b_syncchain_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_b_syncchain[1]),
        .Q(rotary[0]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBAAF2AA8)) 
    \rotary_state[0]_i_1 
       (.I0(rotary_state[0]),
        .I1(direction),
        .I2(rotary_state[1]),
        .I3(rotary[1]),
        .I4(rotary[0]),
        .O(\rotary_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF8D0F5B0)) 
    \rotary_state[1]_i_1 
       (.I0(rotary_state[0]),
        .I1(direction),
        .I2(rotary_state[1]),
        .I3(rotary[1]),
        .I4(rotary[0]),
        .O(\rotary_state[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rotary_state_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\rotary_state[0]_i_1_n_0 ),
        .Q(rotary_state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rotary_state_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\rotary_state[1]_i_1_n_0 ),
        .Q(rotary_state[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[1]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[2]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_2 
       (.I0(s00_axi_awvalid),
        .I1(S_AXI_WREADY),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__2));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(s00_axi_wstrb[0]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(S_AXI_ARREADY),
        .I1(axi_rvalid_reg_0),
        .I2(s00_axi_arvalid),
        .O(slv_reg_rden__0));
endmodule

(* CHECK_LICENSE_TYPE = "termprj_top_rotaryio_0_0,rotaryio_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "rotaryio_v1_0,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (i_ROTARY_A,
    i_ROTARY_B,
    i_PSW,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  input i_ROTARY_A;
  input i_ROTARY_B;
  input i_PSW;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 52631580, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN termprj_top_processing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 52631580, PHASE 0.000, CLK_DOMAIN termprj_top_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire i_PSW;
  wire i_ROTARY_A;
  wire i_ROTARY_B;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rotaryio_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .i_PSW(i_PSW),
        .i_ROTARY_A(i_ROTARY_A),
        .i_ROTARY_B(i_ROTARY_B),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
