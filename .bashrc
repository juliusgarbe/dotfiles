# ********************************************
# DO NOT PRINT ANY OUTPUT FROM THIS FILE!
# ********************************************

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# load aliases, functions, and variables
[ -f $HOME/.bash/aliases.sh ] && source $HOME/.bash/aliases.sh
[ -f $HOME/.bash/functions.sh ] && source $HOME/.bash/functions.sh
[ -f $HOME/.bash/variables.sh ] && source $HOME/.bash/variables.sh

# load fzf auto-completion and key bindings
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# load cdo auto-completions
[ -f $HOME/.cdo/cdoCompletion.bash ] && source $HOME/.cdo/cdoCompletion.bash

