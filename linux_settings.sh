#!/bin/bash
# Settings for the Cinnamon desktop

source ./script_utils.sh
runprompt "process settings"

print2screen "Turning off bluetooth"
rfkill block bluetooth

print2screen "Adjusting local RTC settings for dual-booting Windows"
timedatectl set-local-rtc 1 --adju

