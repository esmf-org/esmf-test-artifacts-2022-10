#!/bin/bash -l
export JOBID=NO_BATCH
module load gfortran-12.2.0_clang-14.0.0 4.0.2
module load netcdf-4.9.0

set -x
export ESMF_DIR=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpich_g_release_8.4.0/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpich_g_release_8.4.0/module-build.log
cd /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpich_g_release_8.4.0/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 8 2>&1| tee ../build.log
