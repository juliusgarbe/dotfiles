# ********************************************
# DO NOT PRINT ANY OUTPUT FROM THIS FILE!
# ********************************************

#echo "********** BASHRC **********"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# load aliases, if existing
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# activate ZSH as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

