# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 4
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.cache/wt [current_project]
set_property parent.project_path C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-20:part0:1.0 [current_project]
set_property ip_repo_paths {
  c:/Users/kiki1/Desktop/assignments/Zynq_termprj/gfx_source/rotaryio_1.0
  c:/Users/kiki1/Desktop/assignments/Zynq_termprj/gfx_source/bridgeio_1.0
} [current_project]
update_ip_catalog
set_property ip_output_repo c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/hdl/termprj_top_wrapper.v
add_files C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/termprj_top.bd
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_processing_system7_0_1/termprj_top_processing_system7_0_1.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_xbar_0/termprj_top_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_rst_ps7_0_53M_0/termprj_top_rst_ps7_0_53M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_rst_ps7_0_53M_0/termprj_top_rst_ps7_0_53M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_rst_ps7_0_53M_0/termprj_top_rst_ps7_0_53M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_util_ds_buf_0_0/termprj_top_util_ds_buf_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_util_ds_buf_0_0/termprj_top_util_ds_buf_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_axi_gpio_0_1/termprj_top_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_axi_gpio_0_1/termprj_top_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_axi_gpio_0_1/termprj_top_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_clk_wiz_0_2/termprj_top_clk_wiz_0_2_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_clk_wiz_0_2/termprj_top_clk_wiz_0_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_clk_wiz_0_2/termprj_top_clk_wiz_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/ip/termprj_top_auto_pc_0/termprj_top_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.srcs/sources_1/bd/termprj_top/termprj_top_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/kiki1/Desktop/assignments/Zynq_termprj/gfx_source/Zybo-Z7-Master.xdc
set_property used_in_implementation false [get_files C:/Users/kiki1/Desktop/assignments/Zynq_termprj/gfx_source/Zybo-Z7-Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top termprj_top_wrapper -part xc7z020clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef termprj_top_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file termprj_top_wrapper_utilization_synth.rpt -pb termprj_top_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
