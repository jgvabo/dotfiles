# Aliases
alias ls='ls --color=auto --show-control-chars -F'
alias ll="ls -l -F"
alias vi=vim
alias ..="cd .."
alias matlab="matlab -nodesktop -nosplash"
alias x11small="xrandr --size 800x600"
alias x11win="xrandr --size 1024x768"
alias x11one="xrandr --size 1920x1080"
alias x11two="xrandr --size 3840x1080"
alias tmux="TERM=screen-256color-bce tmux"

# Prompt
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
    # Git prompt
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
    GIT_PROMPT_THEME=Solarized_UserHost # use theme optimized for solarized color scheme
    source ~/.bash-git-prompt/gitprompt.sh
else
    # User@host
    source ~/.prompt.sh
fi


#export TERM="xterm-color"
set input-meta on
set output-meta on
export LESSCHARSET="latin1"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less -r"
unset  SDP_setup_done

# ignore case for autocompletion
bind 'set completion-ignore-case on'

# Python 2.7
# export PYTHON="2.7"
# source /prog/sdpsoft/environment.sh

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If at work
[ -f ~/.bash_work ] && source ~/.bash_work 
