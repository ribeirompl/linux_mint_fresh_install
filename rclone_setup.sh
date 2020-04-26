#!/bin/bash
# Setting up Rclone

source ./script_utils.sh
runprompt "Rclone setup"

####### Start script #######
print2screen "Follow the on-screen prompts (use the defaults \"\")"
rclone config
