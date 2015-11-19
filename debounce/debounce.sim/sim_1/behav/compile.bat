@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;C:/Xilinx/SDK/2014.1/bin;C:/Xilinx/Vivado/2014.1/ids_lite/ISE/bin/nt64;C:/Xilinx/Vivado/2014.1/ids_lite/ISE/lib/nt64;C:/Xilinx/Vivado/2014.1/bin;%PATH%
set XILINX_PLANAHEAD=C:/Xilinx/Vivado/2014.1

xelab -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot tb_debounce_behav --prj T:/15.800000105/fpga_allan/debounce/debounce.sim/sim_1/behav/tb_debounce.prj   xil_defaultlib.tb_debounce
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
