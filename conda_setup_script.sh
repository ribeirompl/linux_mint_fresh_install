#!/bin/bash
# Installation of Anaconda and settings for Linux Mint 19.3 Cinnamon

source ./script_utils.sh
runprompt "Miniconda setup"

####### Start script #######
print2screen "Installing Zsh"
sudo apt install zsh # Installing to setup the zshrc with conda


print2screen "Installing Miniconda"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda-latest.sh && \
bash ./miniconda-latest.sh -b -p $HOME/miniconda && \
\rm ./miniconda-latest.sh && \
source $HOME/miniconda/bin/activate

[ -f $HOME/.bashrc ] && conda init bash

[ -f $HOME/.zshrc ] && conda init zsh

if [[ $SHELL == "/bin/bash" ]]; then
    source $HOME/.bashrc
elif [[ $SHELL == "/bin/zsh" ]]
    source $HOME/.zshrc
else
    echo -e "${COLOUR}Unable to determine current shell. Exiting env setup...${NORMAL}"
    exit 1;
fi

conda create -y --name py37 python==3.7 && \
conda activate py37

conda install pytorch torchvision cudatoolkit=10.1 -c pytorch
conda install matplotlib numpy scipy jupyter
pip install joblib # Used for parallel computing


