#!/bin/bash

#conda create -n venv_audioML
#conda activate venv_audioML
#conda install pip
#$HOME/anaconda/envs/venv_audioML/bin/pip install python_speech_features # For MFCC's and filterbank energies (https://python-speech-features.readthedocs.io/en/latest/)
#conda install matplotlib numpy scipy

pip install python_speech_features
pip install joblib # Used for parallel computing
