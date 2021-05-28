#!/bin/bash

# ALIASES

# tools & software
alias aliases="vi ~/.bash_aliases"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias subl="/home/albrecht/software/sublime_text_3/sublime_text"
alias nb="jupyter notebook --no-browser --port=8081 --NotebookApp.iopub_data_rate_limit=10000000000"
alias p="python"
alias nv="ncview -noautoflip -pause_on_restart -small -maxsize 75" #maxsize: in percent #1280,1024
#alias ncdump="/p/system/packages/anaconda/2.3.0/bin/ncdump"
alias nd="ncdump -h"
alias ndv="ncdump -v"
alias ndiff="ncdiff"
alias diff="vimdiff"
alias less="less -MNS"
alias o="bat"
alias tailf="tail -f"
alias top="top -c -u $USERNAME"
alias v="vi"
alias d="display"
alias du="du -ach"
alias grep="grep -iIns --color=always"
alias grepr="grep -r"
alias quota="mmlsquota --block-size T tmp"
alias untar="tar -xvf"
alias untargz="tar -xzvf"

# modules
alias ma="module avail"
alias mm="module list"
alias ml="module load"
alias mu="module unload"
alias mp="module purge"
alias ms="module show"

# navigation
alias ll="ls -AlGhv"
alias llt="ls -AlGhvtr"
alias ..='cd ../'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias rm="rm -i"
alias md="mkdir"
alias c="clear"
alias e="exit"

# custom paths
alias cdh="cd /home/garbe"
alias cdt="cd /p/tmp/garbe/projects"
alias cdp="cd /p/projects/pism/garbe"
alias cdm="cd /p/projects/pism"
alias cdd="cd /p/projects/dominoes"

alias pism="cd /home/garbe/pism"
alias exp="cd /home/garbe/pism_experiments"
alias hyst="cd /p/tmp/garbe/projects/AIS_StepForcing"
alias equi="cd /p/tmp/garbe/projects/AIS_Equilibrium"
alias over="cd /p/tmp/garbe/projects/AIS_Overshoots"
alias thres="cd /p/tmp/garbe/projects/AIS_Threshold"
alias data="cd /p/projects/pism/garbe/2018_PISM_Input_Data"

alias cmake_pism="rm -rf build/ && bash CmakePismOnBroadwell.sh"

# git
alias gstat="git status"
alias glog="git log --graph --oneline --decorate --all"
alias gadd="git add"
alias gdiff="git diff --"
alias gcomm="git commit"
alias gpush="git push"
alias gpull="git pull"
alias gcp="git commit --verbose && git push"

# slurm
alias sq="squeue -u $USERNAME -i 1 "
alias sm="smap -i 1"
alias sv="sview &"
alias sb="sbatch"
alias sc="scancel"
alias ssq="sacctmgr show qos format=name,priority,maxwall,mintres,maxtres,grptres"
alias sj="scontrol show job -dd"
alias sa="sacct"
alias st="sstat"
alias su="sclass"
#alias sh="sshare -u $USERNAME -A $(groups | tr ' ' ',')"
alias sh="sshare | \grep -e 'User' -e '$USERNAME'"
