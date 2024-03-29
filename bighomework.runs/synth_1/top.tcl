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
create_project -in_memory -part xc7a35ticpg236-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Vivado_/bighomework/bighomework.cache/wt [current_project]
set_property parent.project_path D:/Vivado_/bighomework/bighomework.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths d:/Vivado_/IP_Project [current_project]
set_property ip_output_repo d:/Vivado_/bighomework/bighomework.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files c:/Users/86180/Documents/MATLAB/mouse.coe
add_files c:/Users/86180/Documents/MATLAB/image1.coe
add_files c:/Users/86180/Documents/MATLAB/image2.coe
add_files c:/Users/86180/Documents/MATLAB/image3.coe
add_files d:/Vivado_/bighomework/coefile/mouse.coe
add_files d:/Vivado_/bighomework/coefile/image1.coe
add_files d:/Vivado_/bighomework/coefile/image2.coe
add_files d:/Vivado_/bighomework/coefile/image3.coe
read_verilog -library xil_defaultlib {
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/choose_color.v
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/mouse_env.v
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/ps2_init_funcmod.v
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/ps2_read_funcmod.v
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/show.v
  D:/Vivado_/bighomework/bighomework.srcs/sources_1/new/top.v
}
read_ip -quiet D:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3.xci
set_property used_in_implementation false [get_files -all d:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_3/blk_mem_gen_3_ooc.xdc]

read_ip -quiet D:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2.xci
set_property used_in_implementation false [get_files -all d:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc]

read_ip -quiet D:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_1_1/blk_mem_gen_1.xci
set_property used_in_implementation false [get_files -all d:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_1_1/blk_mem_gen_1_ooc.xdc]

read_ip -quiet D:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all d:/Vivado_/bighomework/bighomework.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Vivado_/bighomework/bighomework.srcs/constrs_1/new/top.xdc
set_property used_in_implementation false [get_files D:/Vivado_/bighomework/bighomework.srcs/constrs_1/new/top.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7a35ticpg236-1L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
