echo "********** ZSHRC **********"

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/lpp/X11/bin:/usr/sbin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

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

#################
#
# FUNCTIONS
#
# open multiple netcdf files at once (example usage: nm extra 100 200 20)
# requires module ncview to be loaded
nm () { ncview $(for n in {$2..$3..$4}; do echo $1_$n.000.nc; done) & }

# upload a file to the PIK cloud server via curl
# usage: $ cu USER PASSW FILE TARGETFILE (put USER and PASSW in single quotes)
# (example usage: cu 'garbe' '***' /path/to/example.file /cloud-path/to/example.file)
cu () { curl -u $1:$2 -T $3 "https://cloud.pik-potsdam.de/remote.php/dav/files/$1/$4" }

# Use environment modules
module() { eval `/usr/share/Modules/$MODULE_VERSION/bin/modulecmd zsh $*`; }

#
# DEFAULT LOADED MODULES
#
#module load pism/stable1.0
module load cdo/1.9.6/gnu-threadsafe
module load intel/2018.1     # required by nco/4.7.8
module load nco/4.7.8
module load ncview/2.1.6
#module load anaconda/5.0.0

# enable conda
. /p/system/packages/anaconda/5.0.0/etc/profile.d/conda.sh

# activate custom conda environment
CONDA_ENV=py2
export CONDA_DIR=/home/garbe/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$CONDA_ENV
#echo "*** CONDA_PREFIX=$CONDA_PREFIX"
conda activate $CONDA_ENV

## Workaround: fancy view of active conda environment in prompt (requires 'changeps1: true' to be set in .condarc)
## TODO: Fix this
export CONDA_DEFAULT_ENV="🐍 $CONDA_DEFAULT_ENV"
conda activate $CONDA_ENV

## fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj

# squeue format
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"

# handle time overlaps when using cdo mergetime
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions

# load custom Xresources file
#echo "*** DISPLAY=$DISPLAY"
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources

# iTerm2 shell integration
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#source ~/.iterm2_shell_integration.bash

#
# ALIASES
#
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# hide the "user@hostname" info in the prompt when logged in as oneself on local machine (agnoster theme)
# more info: https://github.com/agnoster/agnoster-zsh-theme/issues/39#issuecomment-307338817
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

echo "***************************"
