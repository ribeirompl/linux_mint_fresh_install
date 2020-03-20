#!/bin/bash
# Installation of zsh and Oh-My-Zsh

source ./script_utils.sh
runprompt "Zsh setup"

####### Start script #######
print2screen "Installing Oh My Zsh and settings"
sudo apt-get install fonts-powerline -y && \
sudo apt install zsh -y && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
chsh -s $(which zsh) # Change default shell
sudo apt install autojump -y && \
\cp ./installation_file/.zshrc $HOME/.zshrc

# Check if conda is installed and init the .zshrc file
which conda
if [[ $? == 0 ]]; then
    echo -e "${COLOUR}Conda is installed, initialising .zshrc file...${NORMAL}"
    conda init zsh;
    source $HOME/.zshrc
fi


