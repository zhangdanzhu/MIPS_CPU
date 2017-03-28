#!/bin/sh -f
xv_path="/opt/Xilinx/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim pipeline_mips_cpu_behav -key {Behavioral:sim_1:Functional:pipeline_mips_cpu} -tclbatch pipeline_mips_cpu.tcl -log simulate.log
