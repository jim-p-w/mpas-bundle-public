
if ( "$NCAR_HOST" != "derecho" ) then
  echo $0 must be run on derecho
  return
endif
source /etc/profile.d/z00_modules.sh

module --force purge
module load ncarenv/23.09

# ecbuild requires either stack-gcc/12.2.0 or stack-intel/2021.10.0
module use /glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/modulefiles/Core
module load stack-gcc/12.2.0
module load ecbuild
module load cmake/3.26.3 >& /dev/null

module load craype/2.7.23
module load nvhpc/24.9
module load ncarcompilers/1.0.0
module load gcc-toolchain/13.2.0
module load cray-mpich/8.1.29
module load cuda/12.2.1
module load parallel-netcdf/1.12.3
module list

