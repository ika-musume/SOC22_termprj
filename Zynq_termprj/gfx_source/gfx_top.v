module gfx_top
(
    input   wire            i_EMU_MCLK, //54MHz
    input   wire            i_EMU_TMDSCLK, //270MHz

    input   wire            i_MRST_n,

    input   wire    [14:0]  i_AXI_CPU_ADDR,
    output  wire    [15:0]  o_AXI_CPU_DIN,
    input   wire    [15:0]  i_AXI_CPU_DOUT,
    input   wire    [31:0]  i_AXI_CPU_COMMAND,
    output  wire            o_AXI_CPU_BUSY,
    output  wire            o_AXI_CPU_VBLANK_IRQ,

    output  wire    [2:0]   o_TMDS_p,
    output  wire    [2:0]   o_TMDS_n,
    output  wire            o_TMDSCLK_p,
    output  wire            o_TMDSCLK_n
);

/*
    USE 54MHz master clock
    CLK54M  _|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_
    CLK27M  ¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___|¯¯¯|___ <<== HDMI PIXEL CLOCK
    CLK18M  ¯|_____|¯¯¯¯¯|_____|¯¯¯¯¯|_____|¯¯¯¯¯|_____|¯¯¯¯¯|_____|¯¯¯¯¯|_____|¯¯¯¯¯|_____|¯¯¯
    CLK9M   ¯|___________|¯¯¯¯¯¯¯¯¯¯¯|___________|¯¯¯¯¯¯¯¯¯¯¯|___________|¯¯¯¯¯¯¯¯¯¯¯|___________|¯¯¯
    CLK6M   _|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|___________|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|___________|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
*/


reg     [2:0]   clock_counter_6 = 3'd5;
reg     [1:0]   cen_register = 4'b11;
wire            CLK27MPCEN_n = cen_register[1];
wire            CLK18MNCEN_n = cen_register[0];

always @(posedge i_EMU_MCLK) begin
    if(!i_MRST_n) begin
        clock_counter_6 <= 3'd5;
    end
    else begin
        if(clock_counter_6 < 3'd5) begin
            clock_counter_6 <= clock_counter_6 + 3'd1;
        end
        else begin
            clock_counter_6 <= 3'd0;
        end
    end
end

always @(posedge i_EMU_MCLK) begin
    if(!i_MRST_n) begin
        cen_register <= 2'b11;
    end
    else begin
        case(clock_counter_6)
            4'd0: cen_register  <= 2'b01;
            4'd1: cen_register  <= 2'b11;
            4'd2: cen_register  <= 2'b00;
            4'd3: cen_register  <= 2'b11;
            4'd4: cen_register  <= 2'b01;
            4'd5: cen_register  <= 2'b10;
            default: cen_register <= 2'b11;
        endcase
    end
end





//
// FLAT CABLE SIGNAL
//

wire            CLK9MPCEN_n;
wire            CLK9MNCEN_n;
wire            CLK6MPCEN_n;
wire            CLK6MNCEN_n;

wire    [14:0]  CPU_ADDR;
wire    [15:0]  CPU_DIN;
wire    [15:0]  CPU_DOUT;
wire            CPU_RW;
wire            CPU_UDS_n;
wire            CPU_LDS_n;

wire            VZCS_n;
wire            VCS1_n;
wire            VCS2_n;
wire            CHACS_n;
wire            OBJRAM_n;

wire            VBLANK; assign o_AXI_CPU_VBLANK_IRQ = ~VBLANK;
wire            VSYNC;
wire            CSYNC;
wire            BLK;
wire    [10:0]  CD;

wire            ABS_n1H;
wire            ABS_2H;


//
// HDMI and screensim
//
wire    [15:0]      gfx_video; assign gfx_video[15] = 1'b0;
wire    [8:0]       hcounter;
wire    [8:0]       vcounter;



//
// GFX section
//

gfx_cpu cpu_main
(
    .i_EMU_MCLK                     (i_EMU_MCLK             ),
    .i_EMU_CLK18MNCEN_n             (CLK18MNCEN_n           ),

    .i_EMU_CLK9MPCEN_n              (CLK9MPCEN_n            ),
    .i_EMU_CLK9MNCEN_n              (CLK9MNCEN_n            ),
    .i_EMU_CLK6MPCEN_n              (CLK6MPCEN_n            ),
    .i_EMU_CLK6MNCEN_n              (CLK6MNCEN_n            ),

    .i_MRST_n                       (i_MRST_n               ),

    .o_CPU_ADDR                     (CPU_ADDR               ),
    .i_CPU_DIN                      (CPU_DIN                ),
    .o_CPU_DOUT                     (CPU_DOUT               ),
    .o_CPU_RW                       (CPU_RW                 ),
    .o_CPU_UDS_n                    (CPU_UDS_n              ),
    .o_CPU_LDS_n                    (CPU_LDS_n              ),

    .o_VZCS_n                       (VZCS_n                 ),
    .o_VCS1_n                       (VCS1_n                 ),
    .o_VCS2_n                       (VCS2_n                 ),
    .o_CHACS_n                      (CHACS_n                ),
    .o_OBJRAM_n                     (OBJRAM_n               ),

    .i_BLK                          (BLK                    ),
    .i_CD                           (CD                     ),

    .i_ABS_n1H                      (ABS_n1H                ),
    .i_ABS_2H                       (ABS_2H                 ),

    .i_AXI_CPU_ADDR                 (i_AXI_CPU_ADDR         ),
    .o_AXI_CPU_DIN                  (o_AXI_CPU_DIN          ),
    .i_AXI_CPU_DOUT                 (i_AXI_CPU_DOUT         ),
    .i_AXI_CPU_COMMAND              (i_AXI_CPU_COMMAND      ),
    .o_AXI_CPU_BUSY                 (o_AXI_CPU_BUSY         ),

    .o_EMU_VIDEO_R                  (gfx_video[14:10]       ),
    .o_EMU_VIDEO_G                  (gfx_video[9:5]         ),
    .o_EMU_VIDEO_B                  (gfx_video[4:0]         )
);


gfx_video video_main
(
    .i_EMU_MCLK                     (i_EMU_MCLK             ),

    .i_EMU_CLK18MNCEN_n             (CLK18MNCEN_n           ),
    .o_EMU_CLK9MPCEN_n              (CLK9MPCEN_n            ),
    .o_EMU_CLK9MNCEN_n              (CLK9MNCEN_n            ),
    .o_EMU_CLK6MPCEN_n              (CLK6MPCEN_n            ),
    .o_EMU_CLK6MNCEN_n              (CLK6MNCEN_n            ),

    .i_MRST_n                       (i_MRST_n               ),

    .i_CPU_ADDR                     (CPU_ADDR               ),
    .o_CPU_DIN                      (CPU_DIN                ),
    .i_CPU_DOUT                     (CPU_DOUT               ),
    .i_CPU_RW                       (CPU_RW                 ),
    .i_CPU_UDS_n                    (CPU_UDS_n              ),
    .i_CPU_LDS_n                    (CPU_LDS_n              ),

    .i_VZCS_n                       (VZCS_n                 ),
    .i_VCS1_n                       (VCS1_n                 ),
    .i_VCS2_n                       (VCS2_n                 ),
    .i_CHACS_n                      (CHACS_n                ),
    .i_OBJRAM_n                     (OBJRAM_n               ),

    .i_HFLIP                        (1'b0                   ),
    .i_VFLIP                        (1'b0                   ),

    .o_VBLANK_n                     (VBLANK                 ),
    .o_VSYNC_n                      (VSYNC                  ),
    .o_SYNC_n                       (SYNC                   ),
    .o_BLK                          (BLK                    ),
    .o_CD                           (CD                     ),

    .o_ABS_n1H                      (ABS_n1H                ),
    .o_ABS_2H                       (ABS_2H                 ),

    .__REF_HCOUNTER                 (hcounter               ),
    .__REF_VCOUNTER                 (vcounter               )
);

/*
gfx_screensim main
(
    .i_EMU_MCLK                     (i_EMU_MCLK             ),
    .i_EMU_CLK6MPCEN_n              (CLK6MPCEN_n            ),
    .i_HCOUNTER                     (hcounter               ),
    .i_VCOUNTER                     (vcounter               ),
    .i_VIDEODATA                    (gfx_video              )
);
*/

//
// framebuffer timings
//

reg             vsync_dlyd;
reg             start_of_frame;
reg             end_of_line;
wire            data_enable = BLK;
assign o_SOF_TEST = start_of_frame;

always @(posedge i_EMU_MCLK) begin
    if(!CLK6MPCEN_n) begin
        if(!i_MRST_n) begin
            start_of_frame <= 1'b0;
            end_of_line <= 1'b0;
        end
        else begin
            if(hcounter == 9'd148) end_of_line <= 1'b1;
            else end_of_line <= 1'b0;

            if({vsync_dlyd, VSYNC} == 2'b10) start_of_frame <= 1'b1;
            else start_of_frame <= 1'b0;
        end

        vsync_dlyd <= VSYNC;
    end
end


gfx_hdmi hdmi_main (
    .i_EMU_MCLK                     (i_EMU_MCLK             ),
    .i_EMU_TMDSCLK                  (i_EMU_TMDSCLK          ),
    .i_EMU_CLK27MPCEN_n             (CLK27MPCEN_n           ),
    .i_MRST_n                       (i_MRST_n               ),

    .i_EMU_CLK6MPCEN_n              (CLK6MPCEN_n            ),
    .i_DE                           (data_enable            ),
    .i_SOF                          (start_of_frame         ),
    .i_EOL                          (end_of_line            ),
    .i_GFX_VIDEO                    (gfx_video              ),

    .o_TMDS_p                       (o_TMDS_p               ),
    .o_TMDS_n                       (o_TMDS_n               ),
    .o_TMDSCLK_p                    (o_TMDSCLK_p            ),
    .o_TMDSCLK_n                    (o_TMDSCLK_n            )
);




endmodule