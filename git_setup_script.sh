#!/bin/bash
# Setup github ssh keys. Reference: https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# Warning, not robust when saving ssh key to a file other than "~/.ssh/id_rsa"

####### Script setup #######
COLOUR="\033[1;36m"
NORMAL="\033[0m"
INVALID="\033[1;31m"

if [[ $UID == 0 ]]; then
    echo -e "${COLOUR}Please run this script WITHOUT sudo:${NORMAL}"
    echo "$0 $*"
    exit 1
fi

####### Start script #######
echo -e -n "${COLOUR}Run Github SSH Key setup script? (y/n) ${NORMAL}" && read -r REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    # handle exits from shell or function but don't exit interactive shell
fi

# Get github commit email
function getemail() {
   echo -e -n "${COLOUR}Enter Github commit email (preferably your public userID+username@users.noreply.github.com email): ${NORMAL}" && read -r EMAIL
    # Simple but not robust email validation
    if [[ $EMAIL =~ ^.+@.+$ ]]; then
        echo -e "\n${COLOUR}Using $EMAIL"
        echo -e -n "${COLOUR}Is this correct? (y/n): ${NORMAL}" && read -r REPLY
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            emailok="true"            
        fi    
    else
        echo -e "${INVALID}Invalid email"
    fi
}

# Get valid email from user
emailok="false"
getemail
while [[ $emailok == "false" ]]; do
    echo
    getemail
done

echo -e -n "${COLOUR}Enter your name to appear in commits: ${NORMAL}" && read -r NAME

echo -e "${COLOUR}Setting git global config for user.email and user.name${NORMAL}\n"
git config --global user.email $EMAIL
git config --global user.name $NAME

# Generate ssh key
echo -e "${COLOUR}Generating SSH key\n${NORMAL}"
ssh-keygen -t rsa -b 4096 -C $EMAIL

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add the SSH private key
ssh-add ~/.ssh/id_rsa

echo -e -n "${COLOUR}Copy ssh key from "~/.ssh/id_rsa" and open Github.com now to add ssh key to settings? (y/n): ${NORMAL}" && read -r REPLY
if [[ $REPLY =~ ^[Yy]$ ]];
then
    # Copy the ssh key to clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub

    echo -e "\n${COLOUR}Copied ssh key to clipboard.${NORMAL}"
    
    firefox https://github.com/settings/ssh/new
else
    echo -e "${COLOUR}Ok. Copy the contents of ~/.ssh/id_rsa.pub later, and head to https://github.com/settings/keys to add the ssh key. Exiting script..."
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo -e -n "\n${COLOUR}After adding the ssh key to github, press Enter to continue and validate ssh key has been setup correctly. ${NORMAL}" && read -r REPLY

echo -e "\n${COLOUR}Check if the following ssh procedure returns ${NORMAL}\"Hi \$username!...\"${COLOUR} to confirm your ssh connection works.\n${NORMAL}"

ssh -T git@github.com

