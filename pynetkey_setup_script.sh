echo -e "\033[1;36mInstalling Pynetkey\033[0m"

####### Start script #######
echo -e -n "\033[1;36mRun Pynetkey setup script? (y/n) \033[0m" && read -r REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    # handle exits from shell or function but don't exit interactive shell
fi

wget https://bitbucket.org/janto/pynetkey/get/tip.zip -O pynetkey.zip && \
mkdir -p $HOME/.pynetkey/ && \
# bsdtar is used to remove the top-level directory in the zip file
bsdtar -xf pynetkey.zip -s'|[^/]*/||' -C $HOME/.pynetkey/ && \
\rm pynetkey.zip && \
# Single quotes are needed for echo-ing the shebang line
echo '#!/bin/bash
# This script closes other pynetkey processes, to avoid filling up memory.
script_name=${BASH_SOURCE[0]}
for pid in $(pidof -x $script_name); do
    if [ $pid != $$ ]; then
        kill -9 $pid
    fi
done

python $HOME/.pynetkey/pynetkey.py' > $HOME/.pynetkey/pynetkey_run.sh && \
chmod 755 $HOME/.pynetkey/pynetkey_run.sh && \
echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=python $HOME/.pynetkey/pynetkey.py
Name=Pynetkey
Icon=$HOME/.pynetkey/icons/main.ico" > $HOME/Desktop/Pynetkey.desktop && \
chmod 755 $HOME/Desktop/Pynetkey.desktop

