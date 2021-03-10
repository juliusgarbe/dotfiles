echo "********** ZSHRC **********"

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/bin:/usr/sbin

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
# open multiple netcdf files at once (requires module ncview to be loaded)
# example usage: nm extra 100 200 20
function nm () {
  ncview $(for n in {$2..$3..$4}; do echo $1_$n.000.nc; done) &
}

# upload a file to the PIK cloud server via curl
# example usage: curltocloud '***' ~/path/to/examplefile (put password in single quotes)
function curltocloud () {
  curl -u "garbe":"$1" -T "$2" "https://cloud.pik-potsdam.de/remote.php/dav/files/garbe/$(basename $2)"
}

# recursively find files (excluding hidden directories and files)
# example usage: findf "*.pdf"
function findf () {
  find -L . -type d -path '*/\.*' -prune -o -not -name '.*' -type f -iname $1 -print
}

# recursively find directories (excluding hidden directories)
# example usage: findd "*historical*"
function findd () {
  find -L . -type d -path '*/\.*' -prune -o -not -name '.*' -type d -iname $1 -print
}

#
# DEFAULT LOADED MODULES
#
# Make ZSH aware of module command
module() { eval `/usr/share/Modules/$MODULE_VERSION/bin/modulecmd zsh $*`; }

# initial module loads
#module load pism/stable1.0
module load cdo
module load intel/2018.1     # required by nco
module load nco
module load ncview
module load netcdf
#module load anaconda

# enable conda
. /p/system/packages/anaconda/5.0.0_py3/etc/profile.d/conda.sh

# activate custom conda environment
MY_CONDA_ENV=py2
export CONDA_DIR=/home/garbe/.conda
export CONDA_PREFIX=$CONDA_DIR/envs/$MY_CONDA_ENV
conda activate $MY_CONDA_ENV

# customize agnoster prompt to show active conda environment (changeps1 should be set to false in .condarc)
prompt_condaenv() {
  prompt_segment green $CURRENT_FG "🐍 $CONDA_DEFAULT_ENV"
}

## DO NOT CHANGE ANYTHING BELOW!
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_condaenv
  prompt_virtualenv
  prompt_aws
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_end
}
PROMPT='%{%f%b%k%}$(build_prompt) '
##

# fix missing PROJ4 env var for basemap
export PROJ_LIB=$CONDA_PREFIX/share/proj

# NetCDF libraries for Fortran compiler
export NETCDF_INC=/p/system/packages/netcdf/4.1.3/intel/16.0.0/serial/include
export NETCDF_LIB=/p/system/packages/netcdf/4.1.3/intel/16.0.0/serial/lib

# slurm settings
export SQUEUE_FORMAT="%8i %70j %6u %8a %2t %12M %12L %12l %5D %4C %8q %18R %10p"
export SACCT_FORMAT="JobID,JobName,Account,QOS,Timelimit,NNodes,AllocCPUS,Elapsed,State,ExitCode,DerivedExitcode"

# handle time overlaps when using cdo mergetime
export SKIPSAMETIME=1 # cdo 1.9.6
export SKIP_SAME_TIME=1 # older cdo versions

# set location of X applications default resources
export XAPPLRESDIR=~/.app-defaults

# load custom Xresources file
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

#
# ALIASES & FUNTIONS
#
# load aliases
[[ -f $HOME/.bash_aliases ]] && source $HOME/.bash_aliases

# load functions
[[ -f $HOME/.bash_functions ]] && source $HOME/.bash_functions

# hide the "user@hostname" info in the prompt when logged in as oneself on local machine (agnoster theme)
# more info: https://github.com/agnoster/agnoster-zsh-theme/issues/39#issuecomment-307338817
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

echo "***************************"
