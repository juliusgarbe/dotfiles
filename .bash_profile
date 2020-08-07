#echo "********** BASH_PROFILE **********" 

# MAKE SHELL AWARE OF ENVIRONMENT MODULES
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


# activate ZSH as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
