# # signoff_hold.tcl
# set_thread_count 7

# # 1. Read Technology and Fast-Fast Liberty Library
# read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
# read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
# read_liberty /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95.lib

# # 2. Read Routed Design and Parasitics
# read_def cpu_top_sky_routed.def
# read_sdc cpu_top.sdc
# read_spef cpu_top_sky_routed.spef

# # 3. Report Hold Timing (Min Path)
# puts "===================================================="
# puts "       FAST CORNER HOLD TIMING CHECK (-40C)         "
# puts "===================================================="
# report_checks -path_delay min
# report_wns
# exit












# # 1. Load Design
# read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
# read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
# read_liberty /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
# read_def cpu_top_sky_routed.def
# read_sdc cpu_top.sdc

# # 2. Define Voltage Sources for the Power Delivery Network
# set_voltage_domain -name CORE -power VPWR -ground VGND

# # 3. Run Static IR Drop Analysis on Power and Ground
# puts "===================================================="
# puts "               POWER NET (VPWR) IR DROP             "
# puts "===================================================="
# analyze_power_grid -net VPWR -voltage 1.8

# puts "===================================================="
# puts "              GROUND NET (VGND) BOUNCE              "
# puts "===================================================="
# analyze_power_grid -net VGND -voltage 0.0

# exit







