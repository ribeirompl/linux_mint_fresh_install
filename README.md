# Linux Mint 19.3 Cinnamon setup script

A script for setting my favourite settings and installing applications onto a fresh Linux Mint installation.

## To use
`sudo apt install git -y`
`git clone https://github.com/ribeirompl/linux_mint_setup_script.git`

The repository contains a couple scripts...
+ A couple
+ `pynetkey_setup_script.sh`
This sets up Pynetkey as well as a desktop icon to easily run it.

## Pre-script steps:
+ Launch Driver Manager to install relevant drivers.

## To run the scripts:
Ensure that the script has execute permissions:
`chmod 744 ./cinnamon_settings.sh`

Then run it within bash: `./cinnamon_settings.sh`

## Post-script steps:
+ Restart PC
+ (Optional) Set preferred pdf reader to okular
+ (Optional) Set Login Window to only appear on primary monitor (Login Window->Settings->Monitor)
+ (Optional) Setup Firefox with preferred settings (e.g. Download location to manual, and remove Highlights)
+ (Optional) In Firefox, go to "about:config" then edit "widget.content.gtk-theme-override" value to be "Adwaita" theme (to fix the dark theme issues)
+ (Optional) Add any online accounts to the GNOME Online Accounts application.
+ (Optional) Setup default sound devices.

## Useful Keyboard shortcuts
+ Hold alt, then use left click to drag window, or right click to resize
+ Super+F to open Firefox
+ Super+C to open Chrome
+ Super+V to open VS Code
+ Super+D to show Desktop
+ Super+M to minimise the current application.
+ Ctrl+Shift+Esc to open System Monitor
+ F2 to rename files/folders.

## Future Plans
+ Updating the script for each major release of Linux Mint Cinnamon.
+ Removing the optional post-script steps and including them in the script.
+ Adding other settings/applications to the script:
    + See the whatsnew page for the current Linux Mint release.
    + Go through other application settings
        + Calendar
        + Libreoffice suite
        + Okular
        + Pix
        + RhythmBox
        + Text Editor
        + VS Code
        + Thunderbird Mail
    + Start redshift service and enable autostart.
    + Remove shortcuts to: show desktop.
    + docker (Maybe through VS code)
    + texlive (LaTeX)
    + Other oh-my-zsh plugins (colorize, command-not-found, dircycle, fasd)
    + oh-my-zsh default prompt setting
    + rsync
    + Set default applications for filetypes such as .md (Markdown)
    + Create relevant home directories such as "projects" and add to Nemo sidebar
+ Add a restart computer prompt at the end of the script.
