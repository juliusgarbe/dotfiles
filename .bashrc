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
[ -f $HOME/.bash/aliases.sh ] && source $HOME/.bash/aliases.sh
[ -f $HOME/.bash/functions.sh ] && source $HOME/.bash/functions.sh
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
