#!/bin/bash
# Settings for the Nemo file explorer.

source ./script_utils.sh
runprompt "Nemo settings"

####### Start script #######
print2screen "Changing Nemo settings"
dconf write /org/nemo/preferences/show-hidden-files true
dconf write /org/nemo/preferences/show-full-path-titles true
dconf write /org/nemo/preferences/quick-renames-with-pause-in-between false
dconf write /org/nemo/preferences/show-compact-view-icon-toolbar false
dconf write /org/nemo/preferences/show-open-in-terminal-toolbar true
dconf write /org/nemo/list-view/default-visible-columns "['name', 'size', 'type', 'date_modified', 'owner', 'permissions']"
dconf write /org/nemo/preferences/ignore-view-metadata true # Each folder is displayed the same way
dconf write /org/nemo/window-state/sidebar-width "160"
# dconf write /org/nemo/preferences/show-advanced-permissions true # Unwanted currently, but maybe in the future

