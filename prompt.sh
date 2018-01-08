#######################################################################
# ~/.bash/prompt.sh                                                   #
# version 0.2.1                                                       #
# by Paul Duncan <pabs@pablotron.org>                                 #
#######################################################################

###############
# Eterm Title #
###############
if [ $TERM = "xterm" ]; then
  XTITLE="\[\e]0;\u@\h (\w) - Bash \v\a\]"
else
  XTITLE=""
fi

#################
# Prompt Colors #
#################
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
DARK_GRAY="\[\033[1;30m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_CYAN="\[\033[1;36m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
ORANGE="\[\033[0;33m\]"
WHITE="\[\033[1;37m\]"
NOTHING="\[\033[0m\]"
##################
# Default Colors #
##################
C_USER="$ORANGE"
C_OP_PAREN="$LIGHT_GRAY"
C_AMP="$LIGHT_GRAY"
C_HOST="$DARK_GRAY"
C_CL_PAREN="$BLACK"
C_COLON="$DARK_GRAY"
C_PWD="$ORANGE"
C_GT="$DARK_GRAY"

##########################
# Custom Hostname Colors #
##########################
#. ~/.bash/host_colors.sh

#############################
# Custom Root Prompt Colors #
#############################
if [ $EUID = "0" ]; then
  C_OP_PAREN="$YELLOW"
  C_USER="$LIGHT_RED"
  C_CL_PAREN="$YELLOW"
fi

#################
# Assign to PS1 #
#################
PS1="$XTITLE""$C_USER""\u""$C_AMP""@""\
$C_HOST""\h""$C_COLON"":\
$C_PWD""\W""$C_GT"">""$NOTHING"

export PS1 
