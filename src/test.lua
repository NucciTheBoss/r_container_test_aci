help([[This is a test container for R and RStudio meant to be run
on the new RHEL7 OS. This test will make sure the singularity containers
and File I/O is functioning properly.

This container is pretty light-weight, just has base R and ggplot2 installed.

For any issues regarding this test please contact Jason at the i-ASK center
at iask@ics.psu.edu or jcn23@psu.edu]])

whatis("R Version: 4.0.2")
whatis("RStudio Version: 1.3.959")

local RStudioexec = "`which singularity` -s exec ${HOME}/sw/r_rstudio/rstudiobase_test.sif rstudio $@ &> /dev/null"
local Rexec = "`which singularity` -s exec ${HOME}/sw/r_rstudio/rstudiobase_test.sif R $@"
local Rscriptexec = "`which singularity` -s exec ${HOME}/sw/r_rstudio/rstudiobase_test.sif Rscript $@"

set_shell_function("rstudio", RStudioexec)
set_shell_function("R", Rexec)
set_shell_function("Rscript", Rscriptexec)
