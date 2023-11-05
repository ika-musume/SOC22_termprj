module gfx_hdmi (
    input   wire            i_EMU_MCLK,
    input   wire            i_EMU_TMDSCLK,
    input   wire            i_EMU_CLK27MPCEN_n, //HDMI pixel clock
    input   wire            i_EMU_CLK6MPCEN_n, //15k pixel clock

    input   wire            i_MRST_n,

    input   wire            i_DE, //data enable
    input   wire            i_SOF, //start of frame
    input   wire            i_EOL, //end of line
    input   wire    [15:0]  i_GFX_VIDEO,

    output  wire    [2:0]   o_TMDS_p,
    output  wire    [2:0]   o_TMDS_n,
    output  wire            o_TMDSCLK_p,
    output  wire            o_TMDSCLK_n
);



///////////////////////////////////////////////////////////
//////  GFX side
////

reg             frame_parity_27m = 1'b0;

reg     [7:0]   fbwr_hcntr = 8'd0;
reg     [7:0]   fbwr_vcntr = 8'd0;
always @(posedge i_EMU_MCLK) begin
    if(!i_MRST_n) begin
        fbwr_hcntr <= 8'd0;
        fbwr_vcntr <= 8'd0;
    end
    else begin
        if(!i_EMU_CLK6MPCEN_n) begin
            if(i_SOF) begin
                fbwr_hcntr <= 8'd0;
                fbwr_vcntr <= 8'd0;
            end
            else begin
                if(i_DE) begin
                    if(i_EOL) begin
                        fbwr_hcntr <= 8'd0; //hcntr reset
                        if(fbwr_vcntr == 223) fbwr_vcntr <= 8'd0;
                        else fbwr_vcntr <= fbwr_vcntr + 8'd1; //vcntr++
                    end
                    else begin
                        fbwr_hcntr <= fbwr_hcntr + 8'd1; //horizontal line increment
                    end
                end
            end
        end
    end
end

wire            fbwr_even = ~i_EMU_CLK6MPCEN_n & i_DE & ~frame_parity_27m;
wire            fbwr_odd = ~i_EMU_CLK6MPCEN_n & i_DE & frame_parity_27m;







///////////////////////////////////////////////////////////
//////  HDMI side
////


/*
    DEFINE HDMI SCREEN

    |------------ACTIVE HORIZONTAL VIDEO-------------|
                                                     <= H front porch
                                                          <= hdmi_hsync
                                                                  <= H back porch
    +------------------------------------------------+----+-------+------+
    |0                                            687| 711|    775|   863|
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                688*506 @ 58Hz                  |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |                                                |    |       |      |
    |505                                             |    |       |      |
    +------------------------------------------------+----+-------+------+ ---
    |508                                             |    |       |      | ^ V front porch
    +------------------------------------------------+----+-------+------+ ---
    |518                                             |    |       |      | ^ hdmi_vsync
    +------------------------------------------------+----+-------+------+ ---
    |526                                             |    |       |      | ^ V back porch
    +------------------------------------------------+----+-------+------+

    https://tomverbeure.github.io/video_timings_calculator

    htotal 864
    vtotal 527

    690/506/60

    CVT
    Pixel clock 27MHz 31.25kHz
    Hactive 688 
    Hblank 176 
    HFP 24 
    hdmi_hsync 64 
    HBP 88

    Vactive 527
    Vblank 21
    VFP 3
    hdmi_vsync 10
    VBP 8

    hdmi_hsync(-) hdmi_vsync(+)
*/

//clock enable generation
reg clk27mcen = 1'b0;
always @(posedge i_EMU_MCLK) begin
    clk27mcen <= ~clk27mcen;
end

//sof synchronizer
reg     [1:0]   sof_27m_dlyd;
reg             sof_27m_synced = 1'b0;
always @(posedge i_EMU_MCLK) begin
    if(clk27mcen) begin
        sof_27m_dlyd[0] <= i_SOF;
        sof_27m_dlyd[1] <= sof_27m_dlyd[0];

        if(sof_27m_dlyd == 2'b01) sof_27m_synced <= 1'b1; //posedge detect
        else sof_27m_synced <= 1'b0;
    end
end

always @(posedge i_EMU_MCLK) begin 
    if(clk27mcen) begin
        if(sof_27m_synced) frame_parity_27m <= ~frame_parity_27m;
    end
end


reg     [9:0]   hdmi_hcntr, hdmi_vcntr;
reg             hdmi_hsync, hdmi_vsync;
always @(posedge i_EMU_MCLK) begin
    if(clk27mcen) begin
        if(sof_27m_synced) begin 
            hdmi_hcntr <= 10'd0;
            hdmi_vcntr <= 10'd0;
        end
        else begin 
            if(hdmi_hcntr == 10'd863) begin
                hdmi_hcntr <= 10'd0;
                if(hdmi_vcntr == 10'd526) hdmi_vcntr <= 10'd0;
                else hdmi_vcntr <= hdmi_vcntr + 10'd1;
            end
            else hdmi_hcntr <= hdmi_hcntr + 10'd1;
        end

        hdmi_hsync <= ~((hdmi_hcntr >= 10'd710) && (hdmi_hcntr < 10'd775)); //neg
        hdmi_vsync <= (hdmi_vcntr >= 10'd507) && (hdmi_vcntr < 10'd518); //pos

    end
end




//define active screen region
reg             hdmi_de, fbrd_de; //DE = data enable
wire            fbrd_ae = (hdmi_hcntr < 256*2 + 88 && hdmi_hcntr >= 88) && (hdmi_vcntr < 224*2 + 28 && hdmi_vcntr >= 28); //AE = address enable
always @(posedge i_EMU_MCLK) begin
    if(clk27mcen) begin
        hdmi_de <= (hdmi_hcntr < 10'd688) && (hdmi_vcntr < 10'd506);
        fbrd_de <= fbrd_ae;
    end
end 

//make framebuffer read counter
wire    [7:0]   fbrd_hcntr = hdmi_hcntr[8:1] - 8'd44;
wire    [7:0]   fbrd_vcntr = hdmi_vcntr[8:1] - 8'd14;

//framebuffer read control
wire            fbrd_even = ~clk27mcen & fbrd_ae & frame_parity_27m;
wire            fbrd_odd = ~clk27mcen & fbrd_ae & ~frame_parity_27m;

//framebuffer read data
wire    [15:0]  fbrd_data_even, fbrd_data_odd;
wire    [15:0]  fbrd_data_muxed = (frame_parity_27m == 1'b0) ? fbrd_data_odd & {16{fbrd_de}} : fbrd_data_even & {16{fbrd_de}};






///////////////////////////////////////////////////////////
//////  Encoders
////

wire [9:0] TMDS_red, TMDS_green, TMDS_blue;
tmds_encoder encoder_r(.i_MCLK(i_EMU_MCLK), .i_PXCEN(clk27mcen), 
                       .i_DATA({fbrd_data_muxed[14:10], 3'b000}), 
                       .i_CONTROL(2'b00), .i_DE(hdmi_de), 
                       .o_TMDS(TMDS_red));

tmds_encoder encoder_g(.i_MCLK(i_EMU_MCLK), .i_PXCEN(clk27mcen),
                       .i_DATA({fbrd_data_muxed[9:5], 3'b000}), 
                       .i_CONTROL(2'b00), .i_DE(hdmi_de),
                       .o_TMDS(TMDS_green));

tmds_encoder encoder_b(.i_MCLK(i_EMU_MCLK), .i_PXCEN(clk27mcen),
                       .i_DATA({fbrd_data_muxed[4:0], 3'b000}),
                       .i_CONTROL({hdmi_vsync,hdmi_hsync}), .i_DE(hdmi_de),
                       .o_TMDS(TMDS_blue));





///////////////////////////////////////////////////////////
//////  TMDS Shifter(270MHz)
////

reg     [9:0]   tmds_ringcntr = 10'b00000_00001; //270MHz, use ring counter instead of normal counter
always @(posedge i_EMU_TMDSCLK) begin
    tmds_ringcntr[9:1] <= tmds_ringcntr[8:0];
    tmds_ringcntr[0] <= tmds_ringcntr[9];
end

reg     [9:0]   tmds_shifter_red, tmds_shifter_green, tmds_shifter_blue;
reg             tmds_clk;
always @(posedge i_EMU_TMDSCLK) begin
    tmds_shifter_red   <= tmds_ringcntr[9] ? TMDS_red   : {1'b0, tmds_shifter_red[9:1]};
    tmds_shifter_green <= tmds_ringcntr[9] ? TMDS_green : {1'b0, tmds_shifter_green[9:1]};
    tmds_shifter_blue  <= tmds_ringcntr[9] ? TMDS_blue  : {1'b0, tmds_shifter_blue[9:1]};

    if(tmds_ringcntr[9]) tmds_clk <= 1'b1;
    else if(tmds_ringcntr[4]) tmds_clk <= 1'b0;
end





///////////////////////////////////////////////////////////
//////  Xilinx primitive: TMDS output
////

//differential output: MUST USE XILINX PRIMITIVE
OBUFDS OBUFDS_r(.I(tmds_shifter_red  [0]), .O(o_TMDS_p[2]), .OB(o_TMDS_n[2]));
OBUFDS OBUFDS_g(.I(tmds_shifter_green[0]), .O(o_TMDS_p[1]), .OB(o_TMDS_n[1]));
OBUFDS OBUFDS_b(.I(tmds_shifter_blue [0]), .O(o_TMDS_p[0]), .OB(o_TMDS_n[0]));
OBUFDS OBUFDS_clock(.I(tmds_clk), .O(o_TMDSCLK_p), .OB(o_TMDSCLK_n));





///////////////////////////////////////////////////////////
//////  Framebuffer
////

hdmi_framebuffer fb_even (
    .i_MCLK                         (i_EMU_MCLK             ),
    .i_RDADDR                       ({fbrd_vcntr, fbrd_hcntr}),
    .i_WRADDR                       ({fbwr_vcntr, fbwr_hcntr}),
    .i_DIN                          (i_GFX_VIDEO            ),
    .o_DOUT                         (fbrd_data_even         ),
    .i_WR                           (fbwr_even              ),
    .i_RD                           (fbrd_even              )
);

hdmi_framebuffer fb_odd (
    .i_MCLK                         (i_EMU_MCLK             ),
    .i_RDADDR                       ({fbrd_vcntr, fbrd_hcntr}),
    .i_WRADDR                       ({fbwr_vcntr, fbwr_hcntr}),
    .i_DIN                          (i_GFX_VIDEO            ),
    .o_DOUT                         (fbrd_data_odd          ),
    .i_WR                           (fbwr_odd               ),
    .i_RD                           (fbrd_odd               )
);

endmodule



module tmds_encoder(
	input   wire            i_MCLK,
	input   wire            i_PXCEN,
	input   wire    [7:0]   i_DATA,  // video data (red, green or blue)
	input   wire    [1:0]   i_CONTROL,  // control data
	input   wire            i_DE,  // video data enable, to choose between i_CONTROL (when i_DE=0) and i_DATA (when i_DE=1)
	output  reg     [9:0]   o_TMDS = 0
);

//See this document
//forum.digikey.com/t/tmds-encoder-vhdl/12653

//let's do popcount
wire    [3:0]   data_popcount = i_DATA[0] + i_DATA[1] + i_DATA[2] + i_DATA[3] + i_DATA[4] + i_DATA[5] + i_DATA[6] + i_DATA[7];

//condition 1
wire            invert_xor = (data_popcount > 4'd4) || (data_popcount == 4'd4 && i_DATA[0] == 1'b0);
wire    [8:0]   q_m = {~invert_xor, q_m[6:0] ^ i_DATA[7:1] ^ {7{invert_xor}}, i_DATA[0]};


//let's do popcount again
/*
    popcount    1s      0s      diff_q_m
    0           0       8       -4
    1           1       7       -3
    2           2       6       -2
    3           3       5       -1
    4           4       4       0
    5           5       3       1
    6           6       2       2
    7           7       1       3
    8           8       0       4
*/

wire signed     [3:0]   diff_q_m = q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7] - 4'sd4;

//disparity accumulator
reg signed      [3:0]   disparity_acc = 4'sd0;

//condition 2 : disparity == 0 OR ones == 4
wire signed             invert_q_m =            (disparity_acc == 4'sd0 || diff_q_m == 4'sd0) ? 
                                                    ~q_m[8] : //condition 3(bottom left)
                                                    (disparity_acc[3] == diff_q_m[3]); //condition 4(right)

//update disparity register: constant generation
wire signed     [3:0]   disparity_acc_const =   (disparity_acc == 4'sd0 || diff_q_m == 4'sd0) ? 
                                                    4'sd0 : //condition 3(bottom left)
                                                    (disparity_acc[3] == diff_q_m[3]) ?
                                                        {3'b000, q_m[8]} : //+0 or +1
                                                        {~q_m[8], 2'b00, ~q_m[8]}; //-1 or +0

//update disparity register: final "new" value
wire signed     [3:0]   disparity_acc_new =     invert_q_m ? 
                                                    disparity_acc - diff_q_m + disparity_acc_const : 
                                                    disparity_acc + diff_q_m + disparity_acc_const;

//define tmds code
wire    [9:0]   tmds_code = i_CONTROL[1] ? 
                                (i_CONTROL[0] ? 10'b1010101011 : 10'b0101010100) : //11 : 10
                                (i_CONTROL[0] ? 10'b0010101011 : 10'b1101010100);  //01 : 00

//final data!
wire    [9:0]   tmds_data = {invert_q_m, q_m[8], q_m[7:0] ^ {8{invert_q_m}}};

//outlatch
always @(posedge i_MCLK) begin
    if(i_PXCEN) o_TMDS <= i_DE ? tmds_data : tmds_code;
end

//update accumulator
always @(posedge i_MCLK) begin
    if(i_PXCEN) disparity_acc <= i_DE ? disparity_acc_new : 4'sd0;
end

endmodule



module hdmi_framebuffer (
    input   wire            i_MCLK,
    input   wire    [15:0]  i_RDADDR,
    input   wire    [15:0]  i_WRADDR,
    input   wire    [15:0]  i_DIN,
    output  reg     [15:0]  o_DOUT,
    input   wire            i_WR,
    input   wire            i_RD
);

reg     [15:0]   RAM [0:(2**16)-1];

always @(posedge i_MCLK) begin
    if(i_WR) RAM[i_WRADDR] <= i_DIN;
end

always @(posedge i_MCLK) begin
    if(i_RD) o_DOUT <= RAM[i_RDADDR];
end

endmodule