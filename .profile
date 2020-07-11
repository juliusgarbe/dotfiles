echo "********** PROFILE **********"
#
# Standard Path
#
PATH=.:$PATH

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
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources


# iTerm2 shell integration
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#source ~/.iterm2_shell_integration.bash
