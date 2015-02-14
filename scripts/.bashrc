# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\$(date +%k:%M:%S), \u@\h] \[$(tput setaf 6)\]\W\[$(tput setaf 2)\] \$ \[$(tput sgr0)\]"
