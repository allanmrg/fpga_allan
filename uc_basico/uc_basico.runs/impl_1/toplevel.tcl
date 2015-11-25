proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir T:/15.800000105/fpga_allan/uc_basico/uc_basico.cache/wt [current_project]
  set_property parent.project_dir T:/15.800000105/fpga_allan/uc_basico [current_project]
  add_files -quiet T:/15.800000105/fpga_allan/uc_basico/uc_basico.runs/synth_1/toplevel.dcp
  add_files T:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/microblazer.bmm
  set_property SCOPED_TO_REF microblazer [get_files -all T:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/microblazer.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all T:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/microblazer.bmm]
  add_files T:/15.800000105/fpga_allan/uc_basico/uc_basico.sdk/SDK/SDK_Export/hello_world/Debug/hello_world.elf
  set_property SCOPED_TO_REF microblazer [get_files -all T:/15.800000105/fpga_allan/uc_basico/uc_basico.sdk/SDK/SDK_Export/hello_world/Debug/hello_world.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all T:/15.800000105/fpga_allan/uc_basico/uc_basico.sdk/SDK/SDK_Export/hello_world/Debug/hello_world.elf]
  read_xdc -ref microblazer_microblaze_0_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_microblaze_0_0/microblazer_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_microblaze_0_0/microblazer_microblaze_0_0.xdc]
  read_xdc -ref microblazer_dlmb_v10_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_dlmb_v10_0/microblazer_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_dlmb_v10_0/microblazer_dlmb_v10_0.xdc]
  read_xdc -ref microblazer_ilmb_v10_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_ilmb_v10_0/microblazer_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_ilmb_v10_0/microblazer_ilmb_v10_0.xdc]
  read_xdc -ref microblazer_mdm_1_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_mdm_1_0/microblazer_mdm_1_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_mdm_1_0/microblazer_mdm_1_0.xdc]
  read_xdc -ref microblazer_clk_wiz_1_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_clk_wiz_1_0/microblazer_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_clk_wiz_1_0/microblazer_clk_wiz_1_0.xdc]
  read_xdc -prop_thru_buffers -ref microblazer_clk_wiz_1_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_clk_wiz_1_0/microblazer_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_clk_wiz_1_0/microblazer_clk_wiz_1_0_board.xdc]
  read_xdc -ref microblazer_rst_clk_wiz_1_100M_0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_rst_clk_wiz_1_100M_0/microblazer_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_rst_clk_wiz_1_100M_0/microblazer_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref microblazer_rst_clk_wiz_1_100M_0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_rst_clk_wiz_1_100M_0/microblazer_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_rst_clk_wiz_1_100M_0/microblazer_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref microblazer_axi_gpio_0_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_0/microblazer_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_0/microblazer_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref microblazer_axi_gpio_0_0 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_0/microblazer_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_0/microblazer_axi_gpio_0_0_board.xdc]
  read_xdc -ref microblazer_axi_gpio_0_1 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_1/microblazer_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_1/microblazer_axi_gpio_0_1.xdc]
  read_xdc -prop_thru_buffers -ref microblazer_axi_gpio_0_1 -cells U0 t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_1/microblazer_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files t:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/sources_1/bd/microblazer/ip/microblazer_axi_gpio_0_1/microblazer_axi_gpio_0_1_board.xdc]
  read_xdc T:/15.800000105/fpga_allan/uc_basico/uc_basico.srcs/constrs_1/imports/Problemas/io_basico.xdc
  link_design -top toplevel -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  catch {update_ip_catalog -quiet -current_ip_cache t:/15.800000105/fpga_allan/uc_basico/uc_basico.cache}
  opt_design 
  write_checkpoint -force toplevel_opt.dcp
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force toplevel_placed.dcp
  catch { report_io -file toplevel_io_placed.rpt }
  catch { report_clock_utilization -file toplevel_clock_utilization_placed.rpt }
  catch { report_utilization -file toplevel_utilization_placed.rpt -pb toplevel_utilization_placed.pb }
  catch { report_control_sets -verbose -file toplevel_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force toplevel_routed.dcp
  catch { report_drc -file toplevel_drc_routed.rpt -pb toplevel_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -file toplevel_timing_summary_routed.rpt -pb toplevel_timing_summary_routed.pb }
  catch { report_power -file toplevel_power_routed.rpt -pb toplevel_power_summary_routed.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

