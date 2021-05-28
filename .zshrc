#echo "********** ZSHRC **********"

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/bin:/usr/sbin
export PATH=$PATH:~/.bat/bat-v0.18.0-x86_64-unknown-linux-musl # PATH for bat (required by fzf)
export PATH=$PATH:~/.iterm2 # PATH for imgcat (required by fzf)

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
plugins=(
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export LC_COLLATE=en_US.utf8

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
# ENVIRONMENT MODULES
#################

# Make ZSH aware of module command
source /usr/share/Modules/$MODULE_VERSION/init/zsh

# initial module loads
#module load pism/stable1.0
module load cdo &> /dev/null  # surpress stdout
module load intel/2018.1     # required by nco
module load nco &> /dev/null  # surpress stdout
module load ncview
#module load netcdf
NETCDF_VERSION=netcdf/4.1.3/intel/16.0.0/serial
module load $NETCDF_VERSION

#################
# ALIASES & FUNTIONS
#################

# set custom prompt
[[ -f $HOME/.bash/prompt.sh ]] && source $HOME/.bash/prompt.sh

# load aliases
[[ -f $HOME/.bash/aliases.sh ]] && source $HOME/.bash/aliases.sh

# load functions
[[ -f $HOME/.bash/functions.sh ]] && source $HOME/.bash/functions.sh

# load custom Xresources file
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# load fzf auto-completion and key bindings
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh
# FIX alt-c key binding
bindkey "ç" fzf-cd-widget

# load cdo auto-completion
[[ -f $HOME/.cdoCompletion.zsh ]] && source $HOME/.cdoCompletion.zsh

#################
# ENVIRONMENT VARIABLES
#################

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

#################
# CONDA ENVIRONMENT
#################

# enable conda
. /p/system/packages/anaconda/5.0.0_py3/etc/profile.d/conda.sh

# activate custom conda environment
MY_CONDA_ENV=py2
export CONDA_DIR=/home/garbe/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$MY_CONDA_ENV
conda activate $MY_CONDA_ENV

# fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj


#echo "***************************"
