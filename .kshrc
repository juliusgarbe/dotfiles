#                                               #
# Username und Pfadangabe im Command-Prompt     #
#                                               #
ncd() { cd $1; PS1="`hostname | cut -d. -f1` `whoami`-$PWD:> "; }
alias cd=ncd
cd .

#export DISPLAY=`hostname`:0.0

# Befehlswiederholung über vi                   #
#                                               #
set -o vi


#                                               #
# alias-Definitionen                            #
#                                               #
#alias ll='ls -ali|pg'
#alias h=history
#alias pp='ps -ef|pg'
#alias psu='ps -l -u $USER'
#alias ff='find $HOME -print -name'
#alias du='du -k'
#alias df='df -k'
#alias cls=clear

alias netscape='/usr/local/netscape470/netscape &'
alias mozilla='/usr/local/mozilla/mozilla &'
alias mozaix03='/usr/bin/mozilla '
alias maker='$FMHOME/bin/maker &'
alias arc81='. /usr/local/arcinfo81/var-arc81.ksh'
alias wincenter='/data/template/scripts/wincenter_1 `hostname`:0.0 '
alias ica='/usr/local/icaclient/aix/wfcmgr &'
alias pdf='/usr/local/acrobat5/bin/acroread &'
