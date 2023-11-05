module gfx_cpu
(
    input   wire            i_EMU_MCLK,
    input   wire            i_EMU_CLK18MNCEN_n,

    input   wire            i_EMU_CLK9MPCEN_n, //REF_CLK9M
    input   wire            i_EMU_CLK9MNCEN_n,
    input   wire            i_EMU_CLK6MPCEN_n, //REF_CLK6M
    input   wire            i_EMU_CLK6MNCEN_n,

    output  wire            i_MRST_n,

    output  wire    [14:0]  o_CPU_ADDR,
    input   wire    [15:0]  i_CPU_DIN,
    output  wire    [15:0]  o_CPU_DOUT,
    output  wire            o_CPU_RW,
    output  wire            o_CPU_UDS_n,
    output  wire            o_CPU_LDS_n,

    output  wire            o_VZCS_n,
    output  wire            o_VCS1_n,
    output  wire            o_VCS2_n,
    output  wire            o_CHACS_n,
    output  wire            o_OBJRAM_n,

    input   wire            i_BLK,
    input   wire    [10:0]  i_CD,

    input   wire            i_ABS_n1H,
    input   wire            i_ABS_2H,

    //AXI CPU I/F
    input   wire    [14:0]  i_AXI_CPU_ADDR,
    output  wire    [15:0]  o_AXI_CPU_DIN,
    input   wire    [15:0]  i_AXI_CPU_DOUT,
    input   wire    [31:0]  i_AXI_CPU_COMMAND,
    output  wire            o_AXI_CPU_BUSY,

    //VIDEO
    output  wire    [4:0]   o_EMU_VIDEO_R,
    output  wire    [4:0]   o_EMU_VIDEO_G,
    output  wire    [4:0]   o_EMU_VIDEO_B
);


reg        [15:0]  cpu_din;

///////////////////////////////////////////////////////////
//////  DTACK generation
////

//DTACK ASYNC SET
wire            dtack_set_n = ~(o_CPU_UDS_n & o_CPU_LDS_n);

//DTACK 0
reg             dtack0_n;
always @(posedge i_EMU_MCLK or negedge dtack_set_n) begin
    if(!dtack_set_n) begin
        dtack0_n <= 1'b1;
    end
    else begin
        if(!i_EMU_CLK6MPCEN_n) dtack0_n <= o_CPU_UDS_n & o_CPU_LDS_n;
    end
end

//DTACK 1
reg             dtack1_n;
always @(posedge i_EMU_MCLK or negedge dtack_set_n) begin
    if(!dtack_set_n) begin
        dtack1_n <= 1'b1;
    end
    else begin
        if(!i_EMU_CLK6MPCEN_n) if(i_ABS_n1H == 1'b0) dtack1_n <= o_CPU_UDS_n & o_CPU_LDS_n;
    end
end

//DTACK 2
reg             dtack2_n;
always @(posedge i_EMU_MCLK or negedge dtack_set_n) begin
    if(!dtack_set_n) begin
        dtack2_n <= 1'b1;
    end
    else begin
        if(!i_EMU_CLK6MNCEN_n) begin //negative edge of CLK6M
            if({i_ABS_2H, ~i_ABS_n1H} == 2'b00) dtack2_n <= o_CPU_UDS_n & o_CPU_LDS_n; //only on px0 or 4
        end
    end
end

//DTACK MUX
reg             dtack_n;
always @(*) begin
    case({o_VZCS_n, o_VCS1_n, o_VCS2_n, o_CHACS_n, o_OBJRAM_n})
        5'b01111: dtack_n <= dtack1_n;
        5'b10111: dtack_n <= dtack2_n;
        5'b11011: dtack_n <= dtack2_n;
        5'b11101: dtack_n <= dtack2_n;
        5'b11110: dtack_n <= dtack1_n;
        default: dtack_n <= dtack0_n;
    endcase
end




///////////////////////////////////////////////////////////
//////  AXI-ASYNC bridge
////


/*
    AXI REG0: write-only RW ADDRESS[14:0]
    AXI REG1: read-write RW DATA
    AXI REG2: write-only RW COMMAND
    AXI REG3: read-only BUSY

    AXI COMMAND:
    CCCC_CCXX_XXXX_XXXX_XXXX_XXXX_XXXX_XXWR
    -------                              || 
          |                              |+---- READ
          |                              +----- WRITE
          +------------------------------------ scroll/tilemap1/tilemap2/character/sprite/palette

    STANDBY_S0: wait for AXI command, clear busy flag
    OPSTART_S0: operation start, set busy flag, copy parameters
    OPSTART_S1: branch state

    READ_S0: bus tri-state
    READ_S1: place address
    READ_S2: assert data strobe
    READ_S3: hold
    READ_S4: sample data transfer acknowledge
    READ_W0: wait 0
    READ_W1: wait 1
    READ_S5: hold
    READ_S6: hold
    READ_S7: sample data and negate strobe
    
    WRITE_S0: bus tri-state
    WRITE_S1: place address
    WRITE_S2: assert data strobe
    WRITE_S3: hold
    WRITE_S4: sample data transfer acknowledge
    WRITE_W0: wait 0
    WRITE_W1: wait 1
    WRITE_S5: hold
    WRITE_S6: hold
    WRITE_S7: sample data and negate strobe

    DONE_S0: check AXI command, if not initialized, wait for clear-out
*/

//define bridge FSM states
localparam STANDBY_S0 = 5'd0;
localparam OPSTART_S0 = 5'd1;
localparam OPSTART_S1 = 5'd2;
localparam DONE_S0    = 5'd3;

localparam READ_S0    = 5'd4;
localparam READ_S1    = 5'd5;
localparam READ_S2    = 5'd6;
localparam READ_S3    = 5'd7;
localparam READ_S4    = 5'd8;
localparam READ_S5    = 5'd9;
localparam READ_S6    = 5'd10;
localparam READ_S7    = 5'd11;
localparam READ_S8    = 5'd12;
localparam READ_W0    = 5'd13;
localparam READ_W1    = 5'd14;

localparam WRITE_S0   = 5'd16;
localparam WRITE_S1   = 5'd17;
localparam WRITE_S2   = 5'd18;
localparam WRITE_S3   = 5'd19;
localparam WRITE_S4   = 5'd20;
localparam WRITE_S5   = 5'd21;
localparam WRITE_S6   = 5'd22;
localparam WRITE_S7   = 5'd23;
localparam WRITE_S8   = 5'd24;
localparam WRITE_W0   = 5'd25;
localparam WRITE_W1   = 5'd26;


//state register
reg     [4:0]   bridge_fsm_state;

//axi side register latch
reg     [14:0]  axi_addr;
reg     [15:0]  axi_dout;
reg     [31:0]  axi_command;

//latches
reg     [14:0]  async_addr  = 15'h0;          assign o_CPU_ADDR = async_addr;
reg     [15:0]  async_dout  = 16'hFFFF;       assign o_CPU_DOUT = async_dout;
reg     [15:0]  async_din   = 16'hFFFF;       assign o_AXI_CPU_DIN = async_din;
reg             async_uds_n = 1'b1;           assign o_CPU_UDS_n = async_uds_n;
reg             async_lds_n = 1'b1;           assign o_CPU_LDS_n = async_lds_n;
reg             async_rw    = 1'b1;           assign o_CPU_RW = async_rw;
reg             async_busy  = 1'b0;           assign o_AXI_CPU_BUSY = async_busy;

reg     [5:0]   async_cs_n = 6'h3F;
assign o_VZCS_n = async_cs_n[5];
assign o_VCS1_n = async_cs_n[4];
assign o_VCS2_n = async_cs_n[3];
assign o_CHACS_n = async_cs_n[2];
assign o_OBJRAM_n = async_cs_n[1];

//make state transition table
always @(posedge i_EMU_MCLK) begin
    if(!i_MRST_n) bridge_fsm_state <= 5'd0;
    else begin
        case(bridge_fsm_state)
            STANDBY_S0: begin
                if(i_AXI_CPU_COMMAND != 32'h0) bridge_fsm_state <= OPSTART_S0; //branch not zero
            end
            OPSTART_S0: bridge_fsm_state <= OPSTART_S1;
            OPSTART_S1: begin
                if(!i_EMU_CLK9MPCEN_n) begin //CLK9M POSITIVE EDGE
                    case(axi_command[1:0])
                        2'b00: bridge_fsm_state <= STANDBY_S0; //nop, return
                        2'b01: bridge_fsm_state <= READ_S0; //read
                        2'b10: bridge_fsm_state <= WRITE_S0; //write
                        2'b11: bridge_fsm_state <= STANDBY_S0; //invalid
                    endcase
                end
            end

            READ_S0: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= READ_S1; //neg
            READ_S1: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= READ_S2; //pos
            READ_S2: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= READ_S3; //neg
            READ_S3: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= READ_S4; //pos
            READ_S4: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= (dtack_n) ? READ_W0 : READ_S5; //neg
            READ_S5: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= READ_S6; //pos
            READ_S6: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= READ_S7; //neg
            READ_S7: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= DONE_S0; //pos

            READ_W0: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= READ_W1; //pos
            READ_W1: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= (dtack_n) ? READ_W0 : READ_S5; //neg


            WRITE_S0: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= WRITE_S1; //neg
            WRITE_S1: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= WRITE_S2; //pos
            WRITE_S2: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= WRITE_S3; //neg
            WRITE_S3: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= WRITE_S4; //pos
            WRITE_S4: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= (dtack_n) ? WRITE_W0 : WRITE_S5; //neg
            WRITE_S5: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= WRITE_S6; //pos
            WRITE_S6: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= WRITE_S7; //neg
            WRITE_S7: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= DONE_S0; //pos

            WRITE_W0: if(!i_EMU_CLK9MPCEN_n) bridge_fsm_state <= WRITE_W1; //pos
            WRITE_W1: if(!i_EMU_CLK9MNCEN_n) bridge_fsm_state <= (dtack_n) ? WRITE_W0 : WRITE_S5; //neg


            DONE_S0: begin
                if(i_AXI_CPU_COMMAND != 32'h0) bridge_fsm_state <= DONE_S0; //stay
                else bridge_fsm_state <= STANDBY_S0; //ready to get the next command
            end

            default: bridge_fsm_state <= STANDBY_S0;
        endcase
    end
end

//make output 
always @(posedge i_EMU_MCLK) begin
    case(bridge_fsm_state)
        STANDBY_S0: begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b0;
        end
        OPSTART_S0: begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;

            axi_addr <= i_AXI_CPU_ADDR; axi_dout <= i_AXI_CPU_DOUT; axi_command <= i_AXI_CPU_COMMAND;
        end
        OPSTART_S1: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        DONE_S0: begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b0;
        end


        READ_S0: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= axi_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1 ; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S1: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= ~axi_command[31:26]; async_uds_n <= 1'b1 ; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S2: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S3: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S4: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S5: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S6: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= cpu_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_S7: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1 ; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end

        READ_W0: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        READ_W1: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b1; async_busy <= 1'b1;
        end end


        WRITE_S0: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= axi_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1 ; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end
        WRITE_S1: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= ~axi_command[31:26]; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S2: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= axi_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S3: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S4: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S5: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S6: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_S7: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b1;
        end end

        WRITE_W0: begin if(!i_EMU_CLK9MPCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b0; async_busy <= 1'b1;
        end end
        WRITE_W1: begin if(!i_EMU_CLK9MNCEN_n) begin
            async_addr <= async_addr; async_dout <= async_dout; async_din <= async_din;
            async_cs_n <= async_cs_n; async_uds_n <= 1'b0; async_lds_n <= 1'b0; async_rw <= 1'b0; async_busy <= 1'b1;
        end end


        default: begin
            async_addr <= 15'h0; async_dout <= 16'hFFFF; async_din <= async_din;
            async_cs_n <= 6'h3F; async_uds_n <= 1'b1; async_lds_n <= 1'b1; async_rw <= 1'b1; async_busy <= 1'b0;
        end
    endcase
end






///////////////////////////////////////////////////////////
//////  Palette RAM
////

//make colorram wr signal
wire            colorram_cs_n = async_cs_n[0];
wire            colorraml_wr = |{colorram_cs_n, o_CPU_RW, o_CPU_LDS_n};
wire            colorramh_wr = |{colorram_cs_n, o_CPU_RW, o_CPU_UDS_n};

//make colorram address
wire    [10:0]  colorram_addr;
assign  colorram_addr = (colorram_cs_n == 1'b0) ? o_CPU_ADDR : i_CD; //cpu addr

//declare COLORRAM
wire    [15:0]  colorram_dout;

SRAM #(.aw( 11 ), .dw(  8 ), .simhexfile("C:/Users/kiki1/Desktop/assignments/zynq_fclk2/fclk_test/gfx/ram_init/init_colorram_high.txt"))
COLORRAM_HIGH
(
    .i_MCLK                     (i_EMU_MCLK                 ),
    .i_ADDR                     (colorram_addr              ),
    .i_DIN                      (o_CPU_DOUT[15:8]           ),
    .o_DOUT                     (colorram_dout[15:8]        ),
    .i_WR_n                     (colorramh_wr               ),
    .i_RD_n                     (1'b0                       )
);

SRAM #(.aw( 11 ), .dw(  8 ), .simhexfile("C:/Users/kiki1/Desktop/assignments/zynq_fclk2/fclk_test/gfx/ram_init/init_colorram_low.txt"))
COLORRAM_LOW
(
    .i_MCLK                     (i_EMU_MCLK                 ),
    .i_ADDR                     (colorram_addr              ),
    .i_DIN                      (o_CPU_DOUT[7:0]            ),
    .o_DOUT                     (colorram_dout[7:0]         ),
    .i_WR_n                     (colorraml_wr               ),
    .i_RD_n                     (1'b0                       )
);

//rgb driver latch
reg     [14:0]  rgblatch;
assign  {o_EMU_VIDEO_B, o_EMU_VIDEO_G, o_EMU_VIDEO_R} = rgblatch & {15{i_BLK}}; //LS09 drivers
always @(posedge i_EMU_MCLK) begin
    if(!i_EMU_CLK6MPCEN_n) begin
        rgblatch <= colorram_dout[14:0];
    end
end





///////////////////////////////////////////////////////////
//////  DATA OUTPUT MUX
////

always @(*) begin
    case({&{o_VZCS_n, o_VCS1_n, o_VCS2_n, o_CHACS_n, o_OBJRAM_n}, colorram_cs_n})
        2'b01: cpu_din <= i_CPU_DIN;
        2'b10: cpu_din <= colorram_dout;
        default: cpu_din <= 16'hFFFF;
    endcase
end

endmodule