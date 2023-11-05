connect -url tcp:127.0.0.1:3121
source C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.sdk/termprj_top_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA" && level==0} -index 1
fpga -file C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.sdk/termprj_top_wrapper_hw_platform_0/termprj_top_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA"} -index 0
loadhw -hw C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.sdk/termprj_top_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA"} -index 0
dow C:/Users/kiki1/Desktop/assignments/Zynq_termprj/Zynq_termprj.sdk/Zynq_termprj/Debug/Zynq_termprj.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351AD6AEAA"} -index 0
con