# create a file  gds.tcl

# 1. Read the LEF files so Magic understands the routing vias (Fixes the M1M2_PR warnings)
lef read /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
lef read /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# 3. Read Your Routed DEF File
def read cpu_top_sky_routed.def

# 3. Read the actual physical GDSII polygons of the Sky130 standard cells
gds read /home/ritiz/pdk/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds

# 5. Write Complete GDS
gds write cpu_top_sky_tapeout.gds

quit -noprompt




