#
# Standard Path
#
PATH=.:$PATH:/usr/local/bin:/usr/lpp/X11/bin:/usr/sbin

## Activate custom conda environment
conda_env=py2
#PATH=~/.conda/envs/py2/bin:$PATH
. /p/system/packages/anaconda/5.0.0/etc/profile.d/conda.sh
conda activate
export CONDA_DIR=/home/garbe/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$conda_env
conda activate $conda_env

## fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj

echo ".profile: CONDA_DIR=$CONDA_DIR"
echo ".profile: CONDA_PREFIX=$CONDA_PREFIX"

# load X resource file
echo ".profile: DISPLAY=$DISPLAY"
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

#  oracle-environment
#if [ -f /usr/local/oracle71/profileoracle/profora71 ]
#then
# . /usr/local/oracle71/profileoracle/profora71;
#fi

# Frame Maker 5
#FMHOME=/usr/local/frame
#export FMHOME
#PATH=$PATH:$FMHOME/bin

# xgmon
#PATH=$PATH:/usr/lpp/xgmon/bin
#GLIB=/usr/lpp/xgmon/lib
#XGMONFONT=9x15

# Netscape470
#MOZILLA_HOME=/usr/local/netscape470
#export MOZILLA_HOME
#unset LIBPATH

# GHOSTVIEW
#export GS_LIB=/usr/local/gs
#PATH=$PATH:/usr/lpp/bin

# UNIRAS Settings
#. /usr/local/uniras/6v5a/base/uni.profile

# MATLAB
#MATLAB=/usr/local/matlab
#PATH=$PATH:$MATLAB/bin

# Ergaenzung um ~/.kshrc fuer jede Kornshell zu aktivieren #
export ENV=$HOME/.kshrc

# Setze locale
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

# iTerm2 shell integration
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#source ~/.iterm2_shell_integration.bash

# activate ZSH as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
