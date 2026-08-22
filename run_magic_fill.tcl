
#   create file   run_magic_fill.tcl

# 1. Load the Tech File
tech load /home/ritiz/pdk/sky130A/libs.tech/magic/sky130A.tech -noprompt

# 2. Read your final taped-out GDS
gds read cpu_top_sky_tapeout.gds
load cpu_top

# 3. Tell Magic to use the specialized Sky130 Waffle Fill Generator
cif ostyle wafflefill(tiled)

# 4. Write ONLY the dummy fill to a new, separate GDS file
gds write cpu_top_fill_only.gds

quit -noprompt

#command:  magic -dnull -noconsole -norc run_magic_fill.tcl

