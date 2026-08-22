


read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
read_liberty /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_def cpu_top_sky_routed.def




# # 10. PARASITIC EXTRACTION (OpenRCX)
# define_process_corner -ext_model_index 0 X
# extract_parasitics -ext_model_file /home/ritiz/pdk/sky130A/libs.tech/openlane/rules.openrcx.sky130A.nom.calibre
# write_spef cpu_top_sky_routed.spef

