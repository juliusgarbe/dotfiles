# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm.dd.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.utf8
export LC_ALL=en_US.utf8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

####
# ALIASES
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

# slurm
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

