# Xilinx WebPack modelsim script
#
# 1. Change directory to this source directory
# cd C:/workspace/zpunew/hdl/example
# "do zimzpu.do"

set BreakOnAssertion 1
vlib work

vcom -93 -explicit  zpu_config.vhd
vcom -93 -explicit  ../zpu4/src/zpupkg.vhd
vcom -93 -explicit  ../zpu4/src/txt_util.vhd
vcom -93 -explicit  sim_fpga_top.vhd
vcom -93 -explicit  ../zpu4/src/zpu_core_small.vhd
vcom -93 -explicit  helloworld.vhd
vcom -93 -explicit  ../zpu4/src/timer.vhd
vcom -93 -explicit  io.vhd
vcom -93 -explicit  ../zpu4/src/trace.vhd

# run ZPU
vsim fpga_top
view wave
add wave -recursive fpga_top/zpu/*
#add wave -recursive fpga_top/*
view structure
#view signals

# Enough to run tiny programs
run 10 ms