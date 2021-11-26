#!/bin/bash

# ENVIRONMENT VARIABLES

# Man pages
export MANPAGER=bat
export MAN_POSIXLY_CORRECT=1 # automatically show first page if multiple are available

# NetCDF libraries for Fortran compiler
export NETCDF_INC=/p/system/packages/$NETCDF_VERSION/include
export NETCDF_LIB=/p/system/packages/$NETCDF_VERSION/lib

# slurm settings
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"
export SACCT_FORMAT="JobID,JobName,Account,QOS,Timelimit,NNodes,AllocCPUS,Elapsed,State,ExitCode,DerivedExitcode"

# handle time overlaps when using cdo mergetime
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions

# set location of X applications default resources
export XAPPLRESDIR=~/.app-defaults

# fzf settings
export FZF_DEFAULT_OPTS="--height=70% --cycle --layout=reverse --info=default --prompt='fzf >' \
                         --preview='([[ -d {} ]] && ls -AlGhv --color=always {}) || ([[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file. || bat {} || echo {}) 2> /dev/null | head -200' \
                         --preview-window='right:wrap' \
                         --color='preview-bg:#3B4252'" # nord1
                         # check for image files and open with iTerm2 imgcat (doesn't work)
                         # [[ \$(file --mime {}) =~ image/(png|jpeg) ]] && imgcat {}

# use ncmaps to add colormaps to ncview
export NCVIEWBASE=$HOME/.ncmaps/ncmaps_myselection/

# set custom conda environment and fix variables
export MY_CONDA_ENV=py2
export CONDA_DIR=$HOME/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$MY_CONDA_ENV

# fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj

