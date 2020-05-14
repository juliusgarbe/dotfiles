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
#module load pism/stable1.0
module load cdo/1.9.6/gnu-threadsafe
module load nco/4.7.8
module load ncview/2.1.6
module load anaconda/5.0.0

# ALIASES

# modules
alias ma="module avail"
alias ml="module list"
alias mp="module purge"
alias ms="module show"

# SET ENVIRONMENT VARIABLES

# squeue format
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"

# handle time overlaps when using cdo mergetime
export SKIP_SAME_TIME=1
