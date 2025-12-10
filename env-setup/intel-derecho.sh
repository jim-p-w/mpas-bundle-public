#!/bin/bash
#
source /etc/profile.d/z00_modules.sh

export LMOD_TMOD_FIND_FIRST=yes

# Check if conda is installed. If it is, deactivate it.
if command -v conda >/dev/null 2>&1; then
    conda deactivate
fi

module purge
module load ncarenv/24.12
module use /glade/work/epicufsrt/contrib/spack-stack/derecho/modulefiles
module load ecflow/5.8.4
module load mysql/8.0.33

module use /glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.9.3/envs/ue-oneapi-2024.2.1/install/modulefiles/Core

module load stack-oneapi/2024.2.1
module load stack-cray-mpich/8.1.29
module load stack-python/3.11.7
module load jedi-mpas-env
module list

ulimit -s unlimited
export F_UFMTENDIAN='big_endian:101-200'
export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH
