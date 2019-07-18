# MAKE ZSH AWARE OF ENVIRONMENT MODULES
if [ "${MODULE_VERSION:-}" = "" ]; then
        MODULE_VERSION_STACK="3.2.10"
        MODULE_VERSION="3.2.10"
        export MODULE_VERSION
else
	MODULE_VERSION_STACK="$MODULE_VERSION"
fi
export MODULE_VERSION_STACK

module() { eval `/usr/share/Modules/$MODULE_VERSION/bin/modulecmd zsh $*`; }

MODULESHOME=/usr/share/Modules/3.2.10
export MODULESHOME

if [ "${LOADEDMODULES:-}" = "" ]; then
  LOADEDMODULES=
  export LOADEDMODULES
fi

if [ "${MODULEPATH:-}" = "" ]; then
  MODULEPATH=`sed -n 's/[       #].*$//; /./H; $ { x; s/^\n//; s/\n/:/g; p; }' ${MODULESHOME}/init/.modulespath`
  export MODULEPATH
fi


# LOAD MODULES
module load pism/stable1.0
module load git/2.5.0
module load anaconda/5.0.0

# SQUEUE FORMAT
export SQUEUE_FORMAT="%8i %46j %6u %2t %12M %12L %12l %5D %4C %8q %18R %10p"

