echo "********** BASHRC **********"

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


# ********************************************
# SET ENVIRONMENT VARIABLES
# ********************************************

# locale
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

# squeue format
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"

# handle time overlaps when using cdo mergetime
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions

# activate custom conda environment
conda_env=py2
#PATH=~/.conda/envs/py2/bin:$PATH
. /p/system/packages/anaconda/5.0.0/etc/profile.d/conda.sh
conda activate
export CONDA_DIR=/home/garbe/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$conda_env
conda activate $conda_env

## fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj

echo "*** CONDA_DIR=$CONDA_DIR"
echo "*** CONDA_PREFIX=$CONDA_PREFIX"

# activate ZSH as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
