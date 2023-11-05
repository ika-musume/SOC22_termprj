-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Nov 26 22:26:54 2022
-- Host        : Ika-musume running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top termprj_top_util_ds_buf_0_0 -prefix
--               termprj_top_util_ds_buf_0_0_ termprj_top_util_ds_buf_0_0_stub.vhdl
-- Design      : termprj_top_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity termprj_top_util_ds_buf_0_0 is
  Port ( 
    BUFG_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFG_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end termprj_top_util_ds_buf_0_0;

architecture stub of termprj_top_util_ds_buf_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BUFG_I[0:0],BUFG_O[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2019.1";
begin
end;
