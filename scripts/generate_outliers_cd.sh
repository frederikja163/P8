#!/bin/bash

source /P8/pytorchenv/bin/activate
cd /P8/MST-OATD-FORK-P8
python generate_outliers.py --dataset cd --device cuda
