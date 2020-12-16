#!/bin/bash
# Simple script to setup this repository for testing
# that the RHEL7 nodes are functional. This script is
# in no way intended to diagnose issues, but rather
# simulate the tipical workflow of users that I work with

# Set up singularity container
echo "Setting up executables"
if [ ! -d ${HOME}/work/sw7/r_rstudio ]; then
    mkdir -p ${HOME}/work/sw7/r_rstudio
fi

wget https://github.com/NucciTheBoss/r_container_test_roar/releases/download/v1.0/rstudiobase_test.sif
mv rstudiobase_test.sif ${HOME}/work/sw7/r_rstudio

# Set up module file
echo "Setting up module"
if [ ! -d ${HOME}/work/sw7/modules/r_rstudio ]; then
    mkdir -p ${HOME}/work/sw7/modules/r_rstudio
fi

cp ${PWD}/src/test.lua ${HOME}/work/sw7/modules/r_rstudio/test.lua
chmod -R ug+rx ${HOME}/work/sw7/modules/r_rstudio

echo "To load the r_rstudio module use the following commands:"
echo -e "\nmodule use ${HOME}/work/sw7/modules"
echo -e "module load r_rstudio/test\n"
echo "All done!"
