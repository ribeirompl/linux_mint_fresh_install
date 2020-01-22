#!/bin/bash
# Installation of apps and settings for Linux Mint 19.3 Cinnamon

# NOTES:
# \cp to avoid alias of cp command
# Reference for settings manipulation in terminal: https://superuser.com/questions/1006983/how-to-set-cinnamon-preferences-in-command-line
# Use dconf watch / to see what changes in configuration files when settings are altered (Only works for some settings).

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
echo -e -n "${COLOUR}Run installation script? (y/n): ${NORMAL}" && read -r REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    # handle exits from shell or function but don't exit interactive shell
fi

print2screen "Turning off bluetooth"
rfkill block bluetooth

print2screen "Updating packages"
sudo apt update && sudo apt upgrade -y

print2screen "Setting Numlock default to ON"
sudo apt-get install numlockx && sudo bash -c 'echo -e "[Greeter]\nactivate-numlock=true" > /etc/lightdm/slick-greeter.conf'

print2screen "Changing Cinnamon Desktop to Traditional"

dconf write /org/cinnamon/panels-enabled "['1:0:bottom']"
dconf write /org/cinnamon/panels-height "['1:27']"
dconf write /org/cinnamon/enabled-applets "['panel1:left:0:menu@cinnamon.org', 'panel1:left:1:show-desktop@cinnamon.org', 'panel1:left:2:panel-launchers@cinnamon.org', 'panel1:left:3:window-list@cinnamon.org', 'panel1:right:0:systray@cinnamon.org', 'panel1:right:1:xapp-status@cinnamon.org', 'panel1:right:2:keyboard@cinnamon.org', 'panel1:right:3:notifications@cinnamon.org', 'panel1:right:4:printers@cinnamon.org', 'panel1:right:5:removable-drives@cinnamon.org', 'panel1:right:6:user@cinnamon.org', 'panel1:right:7:network@cinnamon.org', 'panel1:right:8:sound@cinnamon.org', 'panel1:right:9:power@cinnamon.org', 'panel1:right:10:calendar@cinnamon.org']"
dconf write /org/cinnamon/app-menu-label "'Menu'"
dconf write /org/cinnamon/panel-zone-icon-sizes "'[{"panelId": 1, "left": 0, "center": 0, "right": 0}]'"
dconf write /org/cinnamon/desktop/wm/preferences/theme "'Mint-X'"
dconf write /org/cinnamon/theme/name "'Linux Mint'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-X'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-X'"
dconf write /org/cinnamon/next-applet-id 56
dconf write /org/cinnamon/enabled-applets "['panel1:left:0:menu@cinnamon.org:41', 'panel1:left:1:show-desktop@cinnamon.org:42', 'panel1:left:2:panel-launchers@cinnamon.org:43', 'panel1:left:3:window-list@cinnamon.org:44', 'panel1:right:0:systray@cinnamon.org:45', 'panel1:right:1:xapp-status@cinnamon.org:46', 'panel1:right:2:keyboard@cinnamon.org:47', 'panel1:right:3:notifications@cinnamon.org:48', 'panel1:right:4:printers@cinnamon.org:49', 'panel1:right:5:removable-drives@cinnamon.org:50', 'panel1:right:6:user@cinnamon.org:51', 'panel1:right:7:network@cinnamon.org:52', 'panel1:right:8:sound@cinnamon.org:53', 'panel1:right:9:power@cinnamon.org:54', 'panel1:right:10:calendar@cinnamon.org:55']"
dconf write /org/cinnamon/panel-launchers "['DEPRECATED']"

print2screen "Set background to slideshow"
dconf write /org/cinnamon/desktop/background/slideshow/image-source "'xml:///usr/share/cinnamon-background-properties/linuxmint-tricia.xml'"
dconf write /org/cinnamon/desktop/background/slideshow/slideshow-enabled true
dconf write /org/cinnamon/desktop/background/slideshow/random-order true
dconf write /org/cinnamon/desktop/background/slideshow/delay 15
dconf write /org/cinnamon/desktop/background/picture-uri "'file:///usr/share/backgrounds/linuxmint-tricia/aandreyev_coal.jpg'"

print2screen "Setting Cinnamon theme"
dconf write /org/cinnamon/desktop/wm/preferences/theme "'Mint-Y-Dark'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark'"

print2screen "Changing calendar settings"
\cp ./setup_files/.cinnamon/configs/calendar@cinnamon.org/55.json ~/.cinnamon/configs/calendar@cinnamon.org/55.json

print2screen "Changing start menu settings"
\cp ./setup_files/.cinnamon/configs/menu@cinnamon.org/41.json ~/.cinnamon/configs/menu@cinnamon.org/41.json

print2screen "Installing panel applets"
wget https://cinnamon-spices.linuxmint.com/files/applets/download-and-upload-speed@cardsurf.zip && \
unzip download-and-upload-speed@cardsurf.zip -d ~/.local/share/cinnamon/applets/ && 
\rm download-and-upload-speed@cardsurf.zip && \
\cp ./setup_files/.cinnamon/configs/download-and-upload-speed@cardsurf/download-and-upload-speed@cardsurf.json ~/.cinnamon/configs/download-and-upload-speed@cardsurf/download-and-upload-speed@cardsurf.json

wget https://cinnamon-spices.linuxmint.com/files/applets/show-hide-applets@mohammad-sn.zip && \
unzip show-hide-applets@mohammad-sn.zip -d ~/.local/share/cinnamon/applets/ && 
\rm show-hide-applets@mohammad-sn.zip && \
\cp ./setup_files/.cinnamon/configs/show-hide-applets@mohammad-sn/show-hide-applets@mohammad-sn.json ~/.cinnamon/configs/show-hide-applets@mohammad-sn/show-hide-applets@mohammad-sn.json

wget https://cinnamon-spices.linuxmint.com/files/applets/pomodoro@gregfreeman.org.zip && \
unzip pomodoro@gregfreeman.org.zip -d ~/.local/share/cinnamon/applets/ && 
\rm pomodoro@gregfreeman.org.zip && \
\cp ./setup_files/.cinnamon/configs/pomodoro@gregfreeman.org/pomodoro@gregfreeman.org.json ~/.cinnamon/configs/pomodoro@gregfreeman.org/pomodoro@gregfreeman.org.json

print2screen "Changing panel settings"
dconf write /org/cinnamon/enabled-applets "['panel1:left:0:menu@cinnamon.org:41', 'panel1:left:2:panel-launchers@cinnamon.org:43', 'panel1:left:3:window-list@cinnamon.org:44', 'panel1:right:8:systray@cinnamon.org:45', 'panel1:right:4:xapp-status@cinnamon.org:46', 'panel1:right:9:keyboard@cinnamon.org:47', 'panel1:right:14:notifications@cinnamon.org:48', 'panel1:right:10:printers@cinnamon.org:49', 'panel1:right:12:removable-drives@cinnamon.org:50', 'panel1:right:7:network@cinnamon.org:52', 'panel1:right:13:sound@cinnamon.org:53', 'panel1:right:11:power@cinnamon.org:54', 'panel1:right:16:calendar@cinnamon.org:55', 'panel1:right:15:separator@cinnamon.org:56', 'panel1:right:6:download-and-upload-speed@cardsurf:63', 'panel1:right:3:pomodoro@gregfreeman.org:64', 'panel1:right:5:show-hide-applets@mohammad-sn:71']"

print2screen "Changing misc. Cinnamon settings"
touch ~/.linuxmint/mintwelcome/norun.flag # Disable welcome screen at startup
dconf write /org/cinnamon/desktop/interface/clock-show-date true
dconf write /org/nemo/desktop/volumes-visible false
dconf write /org/nemo/desktop/home-icon-visible false
dconf write /org/nemo/desktop/computer-icon-visible false
dconf write /org/cinnamon/desktop/notifications/bottom-notifications true
dconf write /org/cinnamon/desktop/media-handling/autorun-never true
dconf write /org/cinnamon/desktop/privacy/remember-recent-files false
dconf write /org/cinnamon/desktop/screensaver/lock-delay "uint32 15"
dconf write /org/cinnamon/desktop/session/idle-delay "uint32 900"
dconf write /org/cinnamon/desktop/screensaver/date-format "'%d %b %Y'"
dconf write /org/cinnamon/desktop/screensaver/use-custom-format true
dconf write /org/cinnamon/desktop/screensaver/show-album-art false
dconf write /org/cinnamon/desktop/screensaver/allow-media-control false
dconf write /org/cinnamon/alttab-switcher-style "'thumbnails'"
dconf write /org/cinnamon/desktop/wm/preferences/num-workspaces 2

print2screen "Changing Nemo settings"
dconf write /org/nemo/preferences/show-hidden-files true
dconf write /org/nemo/preferences/show-full-path-titles true
dconf write /org/nemo/preferences/quick-renames-with-pause-in-between false
dconf write /org/nemo/preferences/show-compact-view-icon-toolbar false
dconf write /org/nemo/preferences/show-open-in-terminal-toolbar true
dconf write /org/nemo/list-view/default-visible-columns "['name', 'size', 'type', 'date_modified', 'owner', 'permissions']"
dconf write /org/nemo/preferences/ignore-view-metadata true # Each folder is displayed the same way
# dconf write /org/nemo/preferences/show-advanced-permissions true # Unwanted currently, but maybe in the future

print2screen "Changing Keyboard settings"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-to-workspace-up "['<Control><Alt>Up']"
dconf write /org/cinnamon/desktop/keybindings/looking-glass-keybinding "@as []"
dconf write /org/cinnamon/desktop/keybindings/show-desklets "@as []"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-windows-backward "['<Shift><Alt>Tab']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-group "['<Alt>grave']"
dconf write /org/cinnamon/desktop/keybindings/wm/switch-group-backward "['<Shift><Alt>asciitilde']"
dconf write /org/cinnamon/desktop/keybindings/wm/unmaximize "@as []"
dconf write /org/cinnamon/desktop/keybindings/wm/activate-window-menu "['<Alt>Menu']"
dconf write /org/cinnamon/desktop/keybindings/wm/begin-resize "@as []"
dconf write /org/cinnamon/desktop/keybindings/wm/begin-move "@as []"
dconf write /org/cinnamon/desktop/keybindings/media-keys/screensaver "['<Super>l', 'XF86ScreenSaver']"
dconf write /org/cinnamon/desktop/keybindings/media-keys/shutdown "['XF86PowerOff']"
dconf write /org/cinnamon/desktop/keybindings/media-keys/logout "@as []"
dconf write /org/cinnamon/desktop/keybindings/media-keys/video-rotation-lock "@as []"
dconf write /org/cinnamon/desktop/keybindings/media-keys/video-outputs "['XF86Display']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name "'Launch Firefox'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/command "'firefox'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/binding "['<Super>f']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/name "'Launch Chrome'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/command "'/usr/bin/google-chrome-stable %U'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom1/binding "['<Super>c']"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/name "'Launch System Monitor'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/command "'gnome-system-monitor'"
dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom2/binding "['<Primary><Shift>Escape']"
dconf write /org/cinnamon/desktop/keybindings/custom-list "['custom0', 'custom1', 'custom2']"
dconf write /org/cinnamon/desktop/keybindings/wm/minimize "['<Super>m']"

print2screen "Changing Cinnamon sound settings"
dconf write /org/cinnamon/sounds/login-enabled false
dconf write /org/cinnamon/sounds/logout-enabled false
dconf write /org/cinnamon/sounds/switch-enabled false
dconf write /org/cinnamon/sounds/tile-enabled false
dconf write /org/cinnamon/sounds/plug-enabled false
dconf write /org/cinnamon/sounds/unplug-enabled false

print2screen "Enabling firewall"
sudo ufw enable

print2screen "Installing Okular PDF reader"
sudo apt install okular -y

print2screen "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
sudo dpkg -i google-chrome-stable_current_amd64.deb && \
\rm google-chrome-stable_current_amd64.deb

print2screen "Installing VSCode"
sudo apt install snapd -y && \
sudo snap install --classic code
# Install powerline fonts for oh-my-zsh in VS Code
wget "https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo for Powerline.ttf" && \ 
mkdir $HOME/.fonts && \
mv "Menlo for Powerline.ttf" $HOME/.fonts/ && \
fc-cache -vf ~/.fonts

print2screen "Installing xclip"
sudo apt-get install xclip -y

print2screen "Installing git"
sudo apt install git -y # Required for installing Oh My Zsh

print2screen "Installing Oh My Zsh and settings"
sudo apt-get install fonts-powerline -y && \
sudo apt install zsh -y && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
chsh -s $(which zsh) # Change default shell
sudo apt install autojump -y && \
\cp ./installation_file/.zshrc ~/.zshrc

print2screen "Installing python3-dev"
sudo apt-get install python3-dev # for compiling (make) some python packages in Github? #TODO confirm, otherwise remove

# Now restart and run other scripts
