#echo "********** BASH_PROFILE **********" 

# activate ZSH as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
