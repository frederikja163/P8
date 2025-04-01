#!/bin/bash

source /P8/pytorchenv/bin/activate
cd /P8/MST-OATD-FORK-P8
python train_update.py --dataset porto --device cuda --update_mode pretrain --train_num 80000
