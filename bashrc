# Platform (e.g. Darwin is macOs)
export PLATFORM=$(uname -s)

# Colored ls
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
    alias ls='ls -G'
fi

# Colored grep
alias grep='grep --color=auto'

# Path
export PATH="~/bin/:$PATH"

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
# Fix for redhat 7
if [ "$PLATFORM" = Linux ]; then
    # TODO - Improve
    # This assumes that we're always on RH if we're on Linux
    majversion=$(lsb_release -rs | cut -f1 -d.)
    if [ "$majversion" = 7 ]; then
        unalias tmux
    fi
fi
alias fzp="fzf --preview=\"head -\$LINES {}\""
alias fzv="vim \$(fzp)"

# Prompt
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
    # Git prompt
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
    GIT_PROMPT_THEME=Single_line_Solarized # use theme optimized for solarized color scheme
    source ~/.bash-git-prompt/gitprompt.sh
fi


#export TERM="xterm-color"
set input-meta on
set output-meta on
export LESSCHARSET="latin1"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less -r"

# Colored less and man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

# ignore case for autocompletion
bind 'set completion-ignore-case on'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Find dir
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# If at work
[ -f ~/.bash_work ] && source ~/.bash_work 

# Homebrew completions
HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
