#!/bin/sh
module load intel/18.0.5 
module load netcdf/4.6.3
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/dunlap/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmf/src/Infrastructure/stubs/mpiuni/mpirun
cd /glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd /glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9
rm -rf esmpy_venv
python3 -m venv esmpy_venv
. esmpy_venv/bin/activate
cd /glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmpy-install.log
make download 2>&1| tee /glade/scratch/dunlap/esmf-testing/intel_18.0.5_mpiuni_O_update_pio2.5.9/esmpy-download.log
deactivate
