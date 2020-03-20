#!/bin/bash
# Installation of various applications/packages

source ./script_utils.sh
runprompt "applications installation"

####### Start script #######
print2screen "Installing snapd"
sudo apt install snapd -y

print2screen "Installing vim"
sudo apt install vim -y

#print2screen "Installing openssh-server"
#sudo apt install openssh-server -y

print2screen "Installing imagemagick"
sudo apt install imagemagick -y

print2screen "Installing ffmpeg"
sudo apt install ffmpeg -y

print2screen "Installing neofetch"
sudo apt install neofetch -y

print2screen "Installing tmux"
sudo apt install tmux -y

print2screen "Installing youtube-dl"
sudo snap install youtube-dl

print2screen "Installing gtypist"
sudo apt install gtypist -y

print2screen "Installing PulseAudio Volume Control"
sudo apt install pavucontrol -y

print2screen "Installing audacity"
sudo apt install audacity -y

print2screen "Installing kdenlive"
sudo snap install kdenlive

print2screen "Installing inkscape"
sudo apt install inkscape -y

print2screen "Installing Thunderbird Mail"
sudo apt install thuderbird -y

print2screen "Installing Redshift"
sudo apt install redshift -y

print2screen "Installing Okular PDF reader"
sudo apt install okular -y

print2screen "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable.deb && \
sudo dpkg -i /tmp/google-chrome-stable.deb && \
\rm /tmp/google-chrome-stable.deb

print2screen "Installing GIMP"
sudo apt install gimp -y
\cp ./setup_files/.gimp/scripts/* $HOME/.gimp*/scripts/

print2screen "Installing OBS"
sudo snap install obs-studio -y 

print2screen "Installing VLC"
sudo apt-get install vlc -y

print2screen "Installing spotify"
sudo snap install spotify -y

print2screen "Installing virtual-box"
wget https://download.virtualbox.org/virtualbox/5.2.36/virtualbox-5.2_5.2.36-135684~Ubuntu~bionic_amd64.deb -O /tmp/virtual-box.deb && \
sudo dpkg -i /tmp/virtual-box.deb && \
rm /tmp/virtual-box.deb

print2screen "Installing VSCode"
sudo snap install --classic code
# Install powerline fonts for oh-my-zsh in VS Code
wget "https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo for Powerline.ttf" && \ 
mkdir $HOME/.fonts && \
mv "Menlo for Powerline.ttf" $HOME/.fonts/ && \
fc-cache -vf $HOME/.fonts

print2screen "Installing xclip"
sudo apt-get install xclip -y

sudo apt-get autoremove -y
sudo apt-get autoclean -y

# TODO:check if needed and supply command to ask user if they want to reboot now or later
echo -e "${COLOUR}Now restart the pc for any changes to take effect${NORMAL}"
# Now restart and run other scripts
