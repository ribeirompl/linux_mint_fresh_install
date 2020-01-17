# Linux Mint 19.3 Cinnamon setup script
## NB: A folder containing the settings files for the various applets on the panel bar still needs to be added before the script is functional.

A script for setting my favourite settings and installing applications onto a fresh Linux Mint installation.

The repository contains 2 scripts:
+ `general_setup_script.sh`
This installs general applications and changes system settings.
+ `git_setup_script.sh`
This sets up git's commit email and username as well as an ssh key for connecting to Github.

## Pre-script steps:
+ Launch Driver Manager to install relevant drivers.

## To run the script:
Ensure that the script has execute permissions:
`chmod 744 ./setup_script.sh`

Then run it: `./general_setup_script.sh`

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

## Future Plans
+ Updating the script for each major release of Linux Mint Cinnamon.
+ Removing the optional post-script steps and including them in the script.
+ Adding other settings/applications to the script:
    + See the whatsnew page for the current Linux Mint release.
    + Go through other cinnamon application settings such as Nemo.
    + Start redshift service and enable autostart.
    + Remove shortcuts to: show desktop, firefox, terminal, nemo etc. in the panel bar.
+ Add a restart computer prompt at the end of the script.
