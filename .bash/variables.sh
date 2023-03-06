#!/bin/bash

# ENVIRONMENT VARIABLES

# PATH adjustments
export PATH=$PATH:/usr/bin:/usr/sbin
export PATH=$PATH:~/.bat/bat-v0.21.0-x86_64-unknown-linux-musl # PATH for bat (required by fzf)
export PATH=$PATH:~/.fd/fd-v8.4.0-x86_64-unknown-linux-musl # PATH for fd (required by fzf)
export PATH=$PATH:~/.iterm2 # PATH for imgcat (required by fzf)

# language settings
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export LC_COLLATE=en_US.utf8

# Use bat instead of less as pager
export PAGER=bat

# Man pages
export MANPAGER=bat
export MAN_POSIXLY_CORRECT=1 # automatically show first page if multiple are available

# Set NetCDF libraries manually so that Fortran compiler can find it
#export NETCDF_INC=/p/system/packages/$NETCDF_VERSION/include
#export NETCDF_LIB=/p/system/packages/$NETCDF_VERSION/lib

# slurm settings
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"
export SACCT_FORMAT="JobID,JobName,Account,QOS,Timelimit,NNodes,AllocCPUS,Elapsed,State,ExitCode,DerivedExitcode"

# handle time overlaps when using cdo mergetime
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions

# use cdo extrapolation when remapping
export REMAP_EXTRAPOLATE=1

# set location of X applications default resources
export XAPPLRESDIR=~/.app-defaults

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type f --type d --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height=70% --cycle --layout=reverse --info=default --ansi --prompt='fzf >' \
--preview='([[ -d {} ]] && ls -AlGhv --color=always {}) || ([[ \$(file --mime {}) =~ image/(png|jpeg|gif|tiff|bmp|x-icon) ]] && echo {} is an image file.) || ([[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file. || bat {} || echo {}) 2> /dev/null | head -200' \
--preview-window='right:wrap' \
--color='bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1,preview-bg:#3B4252'" # nord
# preview with iTerm2 imgcat doesn't work... (see https://github.com/junegunn/fzf/issues/1102)

# use ncmaps to add colormaps to ncview
export NCVIEWBASE=$HOME/.ncmaps/ncmaps_myselection/

# set custom conda environment and fix variables
export MY_CONDA_ENV=py3
export CONDA_DIR=$HOME/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$MY_CONDA_ENV

# fix missing PROJ4 env var for basemap
#export PROJ_LIB=$CONDA_PREFIX/share/proj # use proj4 module instead

# fix missing GMT shared library
export GMT_LIBRARY_PATH=$CONDA_DIR/envs/pygmt/lib

