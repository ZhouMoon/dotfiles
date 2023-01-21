# Use colors in coreutils utilities output
if ls --help 2>&1 | grep -q -- --color
then alias ls='ls --color=auto -F'
else
    alias ls='ls -FG'
fi
alias grep='grep --color'


# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'


# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use pip without requiring virtualenv
syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

syspip2() {
    PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

syspip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'


# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}



# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}




alias clc="clear"
alias lg="/usr/bin/lazygit"
alias vi="/usr/bin/lvim"
alias rg="ranger"
alias .="cd ../"
alias ..="cd ../../"
