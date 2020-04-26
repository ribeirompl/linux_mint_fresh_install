#!/bin/bash
# Setting up buku

source ./script_utils.sh
runprompt "buku setup"

####### Start script #######
print2screen "Installing buku"
git clone https://github.com/jarun/buku && \
cd buku && \
conda create -y --name buku python==3.7 && \
conda activate buku && \
pip install . && \
pip install flask flask_admin flask_api flask_bootstrap flask_paginate flask_wtf arrow && \
cd .. && \
\rm -rf buku && \
conda deactivate buku
