# Loading project DIrection
# reading /opt/intelFPGA_lite/18.0/modelsim_ase/linuxaloem/../modelsim.ini
project open /home/student/Desktop/tp78/modelsim/movement
# Loading project movement
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd failed with 2 errors.
# 2 compiles, 1 failed with 2 errors.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ps movement
# vsim -t ps movement 
# Start time: 23:19:13 on May 04,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
add wave *
force clock 0 0 , 1 5 -repeat 10
force reset 1 0 , 0 10 , 1 970
force dir 0 0 , 1 10 -repeat 20
force enable 0 0, 1 20 - repeat 40
# Time value must not be negative: 20 -
force enable 0 0 , 1 20 -repeat 40
run 1000
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ps movement
# End time: 23:21:40 on May 04,2019, Elapsed time: 0:02:27
# Errors: 1, Warnings: 1
# vsim -t ps movement 
# Start time: 23:21:40 on May 04,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
add wave*
# ** Error: bad option "wave*": should be one of...
#   add atv ?options? ?arg arg ...?
#   add button text action ?disable? ?options? ?help?
#   add dataflow ?options? ?arg arg ...?
#   add lists ?options? ?arg arg ...?
#   add log ?options? ?arg arg ...?
#   add memory options ?arg arg ...?
#   add message ?options? ?arg arg ...?
#   add monitor ?options? ?arg arg ...?
#   add schematic ?options? ?arg arg ...?
#   add testbrowser ?options? ?arg arg ...?
#   add virtual ?options? ?arg arg ...?
#   add watch ?options? ?arg arg ...?
#   add wave ?options? ?arg arg ...?
add wave *
force clock 0 0 , 1 5 -repeat 10
force reset 1 0 , 0 10 , 1 970
force dir 0 0, 1 10 -repeat 20
force enable 0 0 , 1 20 -repeat 40
run 1000
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ps movement
# End time: 23:47:21 on May 04,2019, Elapsed time: 0:25:41
# Errors: 1, Warnings: 1
# vsim -t ps movement 
# Start time: 23:47:21 on May 04,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
add wave *
force clock 0 0 , 1 5 -repeat 10
force reset 1 0 , 0 12, 1 970
force dir 0 0 , 1 10 -repeat 20
force enable 0 0 , 1 20 -repeat 40
run 1000
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd failed with 1 errors.
# 2 compiles, 1 failed with 1 error.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd failed with 1 errors.
# 2 compiles, 1 failed with 1 error.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ps movement
# End time: 23:57:58 on May 04,2019, Elapsed time: 0:10:37
# Errors: 0, Warnings: 1
# vsim -t ps movement 
# Start time: 23:57:58 on May 04,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
add wave *
clock 0 0 , 1 5 , -repeat 10
# unknown or ambiguous subcommand "0": must be add, clicks, format, microseconds, milliseconds, scan, or seconds
force clock 0 0 , 1 5 -repeat 10
force reset 1 0 , 0 12, 1 970
force dir 0 0 , 1 10 -repeat 20
force enable 0 0 , 1 20 -repeat 40
run 1000
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
do Desktop/tp78/scripts/movement.do
# Cannot open macro file: Desktop/tp78/scripts/movement.do
do Home/Desktop/tp78/scripts/movement.do
# Cannot open macro file: Home/Desktop/tp78/scripts/movement.do
do Desktop/tp78/scripts/movement.d
# Cannot open macro file: Desktop/tp78/scripts/movement.d
vsim -t ps movement
# End time: 00:07:00 on May 05,2019, Elapsed time: 0:09:02
# Errors: 4, Warnings: 1
# vsim -t ps movement 
# Start time: 00:07:00 on May 05,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
do Home/Desktop/tp78/scripts/movement.do
# Cannot open macro file: Home/Desktop/tp78/scripts/movement.do
Home/Desktop/tp78/scripts/movement
# invalid command name "Home/Desktop/tp78/scripts/movement"
do Home/Desktop/tp78/scripts/movement
# Cannot open macro file: Home/Desktop/tp78/scripts/movement
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
do Home/Desktop/tp78/scripts/movement.do
# Cannot open macro file: Home/Desktop/tp78/scripts/movement.do
vsim -t ps movement
# End time: 00:10:31 on May 05,2019, Elapsed time: 0:03:31
# Errors: 4, Warnings: 0
# vsim -t ps movement 
# Start time: 00:10:31 on May 05,2019
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.movement(rtl)
add wave *
force clock 0 0 , 1 5 - repeat 10
# Time value must not be negative: 5 -
force clock 0 0 , 1 0 -repeat 10
force reset 1 0 , 0 12 , 1 970
force dir 0 0 , 1 10 -repeat 20
force enable 0 0 , 1 20 -repeat 40
run 1000
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
# Compile of movement-entity.vhd was successful.
# Compile of movement-rtl.vhd was successful.
