#!/bin/bash

source /P8/pytorchenv/bin/activate
cd /P8/MST-OATD-FORK-P8
python train.py --task test --distance 2 --fraction 0.2 --obeserved_ratio 1.0 --dataset porto --device cuda
