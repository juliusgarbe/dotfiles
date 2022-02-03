#!/bin/bash

# ALIASES

# tools & software
alias aliases="vi ~/.bash/aliases.sh"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias subl="/home/albrecht/software/sublime_text_3/sublime_text"
alias nb="jupyter notebook --no-browser --port=8081 --NotebookApp.iopub_data_rate_limit=10000000000"
alias p="python"
alias ncview="ncview -noautoflip -small -maxsize 75" #-pause_on_restart #maxsize: in percent #1280,1024
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
alias rename="rename -v"
alias md="mkdir"
alias c="clear"
alias e="exit"

# custom paths
alias cdh="cd $HOME"
alias cdt="cd $PTMP/projects"
alias cdp="cd $PPROJECTS/pism/$USERNAME"
alias cdm="cd $PPROJECTS/pism"
alias cdd="cd $PPROJECTS/dominoes"

alias pism="cd $HOME/pism"
alias exp="cd $HOME/pism_experiments"
alias data="cd $PPROJECTS/pism/$USERNAME/2018_PISM_Input_Data"

alias equi="cd $PTMP/projects/AIS_Equilibrium"
alias ground="cd $PTMP/projects/AIS_GroundingLineStability"
alias hyst="cd $PTMP/projects/AIS_StepForcing"
alias over="cd $PTMP/projects/AIS_Overshoots"
alias surf="cd $PTMP/projects/AIS_SurfaceMelt"
alias thres="cd $PTMP/projects/AIS_Threshold"

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
alias scall="squeue -u $USER | awk '{print $1}' | xargs -n 1 scancel"
alias ssq="sacctmgr show qos format=name,priority,maxwall,mintres,maxtres,grptres"
alias sj="scontrol show job -dd"
alias sa="sacct"
alias st="sstat"
alias su="sclass"
#alias sh="sshare -u $USERNAME -A $(groups | tr ' ' ',')"
alias sh="sshare | \grep -e 'User' -e '$USERNAME'"
