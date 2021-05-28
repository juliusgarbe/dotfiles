# ********************************************
# DO NOT PRINT ANY OUTPUT FROM THIS FILE!
# ********************************************

# Activate ZSH as default shell
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

