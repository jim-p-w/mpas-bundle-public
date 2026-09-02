#!/bin/bash
#
#source /etc/profile.d/z00_modules.sh

export LMOD_TMOD_FIND_FIRST=yes

# Check if conda is installed. If it is, deactivate it.
if command -v conda >/dev/null 2>&1; then
    conda deactivate
fi

module purge
# ignore that the sticky module ncarenv/... is not unloaded
#module load ncarenv/24.12
#module use /glade/work/epicufsrt/contrib/spack-stack/derecho/modulefiles
#module load ecflow/5.8.4
#module load mysql/8.0.33

module use /home/jwittig/repos1/spack-stack-dev/envs/unified-env.gcc/modules/Core

module load stack-gcc/13.3.0
module load stack-openmpi/5.0.10
#module load stack-python/3.11.15
module load python/3.11.15
# module load jedi-mpas-env is commented out because it loads many modules not needed for
# building and running mpas-bundle on derecho.
# To load all of the modules which were loaded prior to 01/15/2026,
# uncomment out "module load jedi-mpas-env"
# module load jedi-mpas-env
module load py-pycodestyle/2.14.0
module load ecmwf-atlas/0.46.0
module load ecbuild/3.12.0
module load netcdf-cxx4/4.3.1
module load parallelio/2.6.2
module load gsl-lite/0.41.0
module load nccmp/1.9.0.1
module load udunits/2.2.28
# Following modules are required for ioda-converters build
module load bufr/12.3.0
module load py-pybind11/3.0.2
module list

ulimit -s unlimited
export GFORTRAN_CONVERT_UNIT='big_endian:101-200'
export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH

