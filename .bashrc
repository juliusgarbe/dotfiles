# ********************************************
# DO NOT PRINT ANY OUTPUT FROM THIS FILE!
# ********************************************

#echo "********** BASHRC **********"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# load aliases & functions
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
[ -f $HOME/.bash_functions ] && source $HOME/.bash_functions
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
