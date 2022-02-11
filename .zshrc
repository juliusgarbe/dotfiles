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

# Extended globbing and expansion
setopt extended_glob

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
export NETCDF_VERSION=netcdf/4.1.3/intel/16.0.0/serial
module load $NETCDF_VERSION

#################

# set custom prompt
if [[ -f $HOME/.bash/prompt.sh ]]; then
  source $HOME/.bash/prompt.sh
fi

# load custom environment variables
if [[ -f $HOME/.bash/variables.sh ]]; then
  source $HOME/.bash/variables.sh
fi

# load aliases
if [[ -f $HOME/.bash/aliases.sh ]]; then
  source $HOME/.bash/aliases.sh
fi

# load functions
if [[ -f $HOME/.bash/functions.sh ]]; then
  source $HOME/.bash/functions.sh
fi

# load custom Xresources file
if [[ -f $HOME/.Xresources ]]; then
  xrdb -merge $HOME/.Xresources
fi

# load fzf auto-completion and key bindings
if [[ -f $HOME/.fzf.zsh ]]; then
  source $HOME/.fzf.zsh
  bindkey "ç" fzf-cd-widget # FIX alt-c key binding
fi

# load cdo auto-completion
if [[ -f $HOME/.cdo/cdoCompletion.zsh ]]; then
  source $HOME/.cdo/cdoCompletion.zsh
fi

# enable conda and activate custom environment (set in .bash/variables.sh)
. /p/system/packages/anaconda/5.0.0_py3/etc/profile.d/conda.sh
conda activate $MY_CONDA_ENV

# show disk usage on startup
echo "******************** DISK USAGE ********************"
. $HOME/scripts/Cluster/print_project_quota.sh
echo #"****************************************************"

# show dotfiles git status on startup
echo "***************** DOTFILES STATUS ******************"
config status
echo "****************************************************"
