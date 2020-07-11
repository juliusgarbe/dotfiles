echo "********** PROFILE **********"

# load X resource file
echo "*** DISPLAY=$DISPLAY"
[[ -f ~/.Xresources ]] && xrdb -load -I$HOME ~/.Xresources


# iTerm2 shell integration
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#source ~/.iterm2_shell_integration.bash
