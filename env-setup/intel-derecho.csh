#!/bin/csh
#
source /etc/profile.d/z00_modules.csh

setenv LMOD_TMOD_FIND_FIRST yes

# Check if conda is installed. If it is, deactivate it.
if ( `which conda >& /dev/null` ) then
    conda deactivate
endif

# modules for building on derecho with the intel toolchain
#

module purge
module load ncarenv/23.09
module use /glade/work/epicufsrt/contrib/spack-stack/derecho/modulefiles
module load ecflow/5.8.4
module load mysql/8.0.33

module use /glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.8.0/envs/ue-intel-2021.10.0/install/modulefiles/Core

module load stack-intel/2021.10.0
module load stack-cray-mpich/8.1.25
module load stack-python/3.11.7
module load jedi-mpas-env
module unload bufr-query # bufr_query causes ioda build to fail
module list

limit stacksize unlimited
setenv F_UFMTENDIAN 'big_endian:101-200'
setenv LD_LIBRARY_PATH `pwd`/lib:$LD_LIBRARY_PATH
