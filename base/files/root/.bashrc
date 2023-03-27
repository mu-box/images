if [ -t 0 ]; then
    BOLD="$(tput bold)"
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    PURPLE="$(tput setaf 5)"
    RESET="$(tput sgr0)"

    PSC () {
        echo "\[$(printenv ${1})\]"
    }

    shopt -s checkwinsize cdspell extglob histappend
    alias ll='ls -lhAF'
    alias ls='ls --color=auto'
    HISTCONTROL=ignoreboth
    HISTIGNORE="[bf]g:exit:quit"
    PS1="$(PSC BOLD)$(PSC RED)\u@\H$(PSC RESET)$(PSC GREEN):$(PSC RESET)$(PSC YELLOW)\w$(PSC RESET) $(PSC GREEN)\\\$$(PSC RESET) "
    PS2="$(PSC RED)> $(PSC RESET)"

    echo ${PURPLE}
    cat /etc/motd
    echo ${RESET}${RED}
    cat /etc/root.motd
    echo ${RESET}
fi
