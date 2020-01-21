#!/bin/bash
# Installation of Anaconda and settings for Linux Mint 19.3 Cinnamon


####### Script setup #######
COLOUR="\033[1;36m"
NORMAL="\033[0m"

if [[ $UID == 0 ]]; then
    echo -e "${COLOUR}Please run this script WITHOUT sudo:${NORMAL}"
    echo "$0 $*"
    exit 1
fi

function print2screen() { echo -e $"\n${COLOUR} \u2605 $@ \u2605${NORMAL}" ;}

####### Start script #######
echo -e -n "${COLOUR}Run Anaconda setup script? (y/n): ${NORMAL}" && read -r REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    # handle exits from shell or function but don't exit interactive shell
fi

print2screen "Installing Anaconda"
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ./anaconda-latest.sh && \
bash ./anaconda-latest.sh -b -p $HOME/anaconda && \
\rm ./anaconda-latest.sh && \
source $HOME/anaconda/bin/activate && \
conda init bash && \
conda init zsh

# TODO: start/restart shell instance (as requested by Anaconda setup) to load changes?

pip install python_speech_features
pip install joblib # Used for parallel computing

#conda create -n venv_audioML
#conda activate venv_audioML
#conda install pip
#$HOME/anaconda/envs/venv_audioML/bin/pip install python_speech_features # For MFCC's and filterbank energies (https://python-speech-features.readthedocs.io/en/latest/)
#conda install matplotlib numpy scipy
