# MAKE ZSH AWARE OF ENVIRONMENT MODULES
if [ "${MODULE_VERSION:-}" = "" ]; then
        MODULE_VERSION_STACK="3.2.10"
        MODULE_VERSION="3.2.10"
        export MODULE_VERSION
else
	MODULE_VERSION_STACK="$MODULE_VERSION"
fi
export MODULE_VERSION_STACK

MODULESHOME=/usr/share/Modules/$MODULE_VERSION
export MODULESHOME

if [ "${LOADEDMODULES:-}" = "" ]; then
  LOADEDMODULES=
  export LOADEDMODULES
fi

if [ "${MODULEPATH:-}" = "" ]; then
  MODULEPATH=`sed -n 's/[       #].*$//; /./H; $ { x; s/^\n//; s/\n/:/g; p; }' ${MODULESHOME}/init/.modulespath`
  export MODULEPATH
fi


# SET ENVIRONMENT VARIABLES

# squeue format
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"

# handle time overlaps when using cdo mergetime
export SKIP_SAME_TIME=1

## fix missing PROJ4 env var for basemap
#export CONDA_PREFIX=/home/garbe/.conda/envs/py2
#export PROJ_LIB=$CONDA_PREFIX/share/proj
