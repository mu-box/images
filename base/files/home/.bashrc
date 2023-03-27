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
    PS1="$(PSC BOLD)$(PSC BLUE)\u@\H$(PSC RESET)$(PSC GREEN):$(PSC RESET)$(PSC YELLOW)\w$(PSC RESET) $(PSC GREEN)\\\$$(PSC RESET) "
    PS2="$(PSC GREEN)> $(PSC RESET)"
fi

# explicitly build PATH
export PATH=""

# grab evars set by engines
if [ -d /asdf/data/etc/env.d ]; then
    for env in /asdf/data/etc/env.d; do
        export "${env}=$(cat /asdf/data/etc/env.d/${env})"
    done
fi

# grab evars set by hooks
if [ -d /etc/env.d ]; then
    for env in /etc/env.d; do
        export "${env}=$(cat /etc/env.d/${env})"
    done
fi

# let engines/hooks update the PATH
if [[ -n $PATH ]]; then
    export PATH="${PATH}:"
fi

# ensure asdf paths are set
export PATH="${PATH}/asdf/data/shims:/asdf/bin"

# restore OS defaults
export PATH="${PATH}:/usr/local/bin:/usr/bin:/bin"

# custom profile scripts
if [ -d /asdf/data/etc/profile.d ]; then
    for profile in /asdf/data/etc/profile.d; do
        . /asdf/data/etc/profile.d/${profile}
    done
fi

# Source ASDF to initialize the system
. /asdf/asdf.sh
