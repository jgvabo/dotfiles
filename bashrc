# Platform (e.g. Darwin is macOs)
export PLATFORM=$(uname -s)

# Colored ls
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
    alias ls='ls -G'
fi

# Aliases
alias ll="ls -l -F"
alias ..="cd .."
alias matlab="matlab -nodesktop -nosplash"
alias x11macbook="xrandr --size 1280x720"
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
    GIT_PROMPT_THEME=Single_line_Solarized # use theme optimized for solarized color scheme
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

# ignore case for autocompletion
bind 'set completion-ignore-case on'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If at work
[ -f ~/.bash_work ] && source ~/.bash_work 
