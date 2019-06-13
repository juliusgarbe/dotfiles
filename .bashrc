# LOAD MODULES
module load pism/stable1.0
module load git/2.5.0
module load anaconda/5.0.0

# SQUEUE FORMAT
export SQUEUE_FORMAT="%8i %46j %6u %2t %12M %12L %12l %5D %4C %8q %18R %P"

# DEFINE ALIASES
# software
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias subl="/home/albrecht/software/sublime_text_3/sublime_text"
alias nb="jupyter notebook --no-browser --port=8081 --NotebookApp.iopub_data_rate_limit=10000000000"
alias p="python"
alias nv="ncview"
alias nd="ncdump -h"
alias ncd="/p/system/packages/anaconda/2.3.0/bin/ncdump -h"
alias less="less -MNS"
alias o="less"
alias tail="tail -f"
alias top="top -c -u garbe"
alias v="vi"
alias d="display"
alias du="du -ach"
alias grep="grep -inR --color"

# modules
alias ma="module avail"
alias ml="module list"
alias mp="module purge"

# navigation
alias ll="ls -AlGhv"
alias llt="ls -AlGhvt"
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
alias cdd="cd /p/projects/dominoes"

alias pism="cd /home/garbe/pism"
alias exp="cd /home/garbe/pism_experiments"
alias hyst="cd /p/tmp/garbe/projects/AIS_StepForcing"
alias equi="cd /p/tmp/garbe/projects/AIS_Equilibrium"
alias over="cd /p/tmp/garbe/projects/AIS_Overshoots"

alias cmake_pism="rm -rf build/ && bash CmakePismOnBroadwell.sh"

# SLURM
alias sq="squeue -u garbe -i 1 "
alias sm="smap -i 1"
alias sv="sview &"
alias sb="sbatch"
alias sc="scancel"
alias ssq="sacctmgr show qos format=name,priority,maxwall,mintres,maxtres,grptres"
alias sj="scontrol show job -dd"
alias sa="sacct"
alias st="sstat"
alias su="sclass"
