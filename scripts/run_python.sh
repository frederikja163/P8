#!/bin/bash

source /P8/pytorchenv/bin/activate

# cd into project root and run python command
cd /P8/MST-OATD-FORK-P8 || exit
if [ "$2" ]; then
  cd "$2" || exit
fi

python "$1"
