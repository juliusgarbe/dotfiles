# ********************************************
# DO NOT PRINT ANY OUTPUT FROM THIS FILE!
# ********************************************

#echo "********** BASH_PROFILE **********" 

# If not running interactively, don't do anything
case $- in
    *i*)
        export SHELL=`which zsh`
	[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
	;;
      *)
        return
	;;
esac


# activate ZSH as default shell
#export SHELL=`which zsh`
#[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

