if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

source ~/.aliases_bash

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist

# Change command prompt
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# https://bbs.archlinux.org/viewtopic.php?id=48910
# previous in enigma2: "[\u@\h \W]\$ "
# previously in mac: "\h:\W \u\$ "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
# export PS1="\[\e[0;33m\]\A \W \$ \[\e[m\]"

. /etc/bash_completion.d/git
