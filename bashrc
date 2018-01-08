# Aliases
alias ls='ls --color=auto --show-control-chars -F'
alias ll="ls -l -F"
alias vi=vim
alias ..="cd .."
alias cls="clear"
alias matlab="matlab -nodesktop -nosplash"
alias x11small="xrandr --size 800x600"
alias x11win="xrandr --size 1024x768"
alias x11one="xrandr --size 1920x1080"
alias x11two="xrandr --size 3840x1080"
alias tmux="TERM=screen-256color-bce tmux"

# Prompt colors
source ~/.prompt.sh

#export TERM="xterm-color"
set input-meta on
set output-meta on
export LESSCHARSET="latin1"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less -r"
unset  SDP_setup_done

# Python 2.7
# export PYTHON="2.7"
# source /prog/sdpsoft/environment.sh

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If at work
[ -f ~/.bash_work ] && source ~/.bash_work 
