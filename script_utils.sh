#!/bin/bash
# Utility variables/functions for the other scripts

####### Script setup #######
COLOUR="\033[1;36m" # Note the colour is hardcoded in pynetkey_setup_script.sh
NORMAL="\033[0m"

if [[ $UID == 0 ]]; then
    echo -e "${COLOUR}Please run this script WITHOUT sudo:${NORMAL}"
    echo "$0 $*"
    exit 1
fi

function print2screen() { echo -e $"\n${COLOUR} \u2605 $@ \u2605${NORMAL}" ;}

function runprompt() { 
    echo -e -n "${COLOUR}Run $1 script? (y/n): ${NORMAL}" && read -r REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
        # handle exits from shell or function but don't exit interactive shell
    fi
}

