#!/bin/bash

# make python venv based off system packages
~/.local/bin/virtualenv --system-site-packages /P8/pytorchenv

# activate python venv and install latest version of dependencies
source /P8/pytorchenv/bin/activate
python3 -m pip install numpy pandas scipy scikit-learn networkx geopy torch

# preprep used folders for later
cd /P8/MST-OATD-FORK-P8
mkdir logs models probs data data/porto data/cd data/tdrive