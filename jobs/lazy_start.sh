#!/bin/bash

job1=$(sbatch 1preprocess.sh "--dataset tdrive --grid_size 0.3" | awk '{print $4}')
job2=$(sbatch --dependency=afterok:$job1 2generate_outliers.sh "--dataset tdrive" | awk '{print $4}')
job3=$(sbatch --dependency=afterok:$job2 3train.sh "--dataset tdrive --batch_size 200" | awk '{print $4}')
job4=$(sbatch --dependency=afterok:$job3 4test.sh "--dataset tdrive --batch_size 200" | awk '{print $4}')
