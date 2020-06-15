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
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions
