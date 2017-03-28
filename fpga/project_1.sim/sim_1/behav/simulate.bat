@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim pipeline_mips_cpu_behav -key {Behavioral:sim_1:Functional:pipeline_mips_cpu} -tclbatch pipeline_mips_cpu.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
