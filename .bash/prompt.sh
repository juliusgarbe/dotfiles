#!/bin/bash

# CUSTOM PROMPT

# hide the "user@hostname" info in the prompt when logged in as oneself on local machine (agnoster theme)
# more info: https://github.com/agnoster/agnoster-zsh-theme/issues/39#issuecomment-307338817
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# customize agnoster prompt to show active conda environment (changeps1 should be set to false in .condarc)
if [[ "$ZSH_THEME" == "agnoster" ]]; then
  prompt_condaenv() {
    prompt_segment green $CURRENT_FG "🐍 $CONDA_DEFAULT_ENV"
  }
  
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
fi

