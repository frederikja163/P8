#!/bin/bash

source /P8/pytorchenv/bin/activate
cd /P8/MST-OATD-FORK-P8
python train.py --task test --dataset cd --device cuda --batch_size 200
