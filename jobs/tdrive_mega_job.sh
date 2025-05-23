#!/bin/bash

observed_ratios=(0.5 0.7 1.0)

# (0.1, 3), (0.2, 2), (0.3, 2)
fractions=(0.1 0.2 0.3)
distances=(3 2 2)

job1=$(sbatch 1preprocess.sh "--dataset tdrive --grid_size 0.2 --epoch_split 0.3" | awk '{print $4}')

# the following should be run 5 times
job2=$(sbatch --dependency=afterok:$job1 3train.sh "--dataset tdrive --pretrain_epochs 3 --epochs 4 --batch_size 8" | awk '{print $4}')

# Loop through fraction and distance pairs
for i in "${!fractions[@]}"; do
    fraction=${fractions[$i]}
    distance=${distances[$i]}
    
    # Loop through each ratio
    for ratio in "${observed_ratios[@]}"; do
        job3=$(sbatch --dependency=afterok:$job2 2generate_outliers.sh "--dataset tdrive --fraction $fraction --distance $distance --obeserved_ratio $ratio" | awk '{print $4}')
        job4=$(sbatch --dependency=afterok:$job3 4test.sh "--dataset tdrive --fraction $fraction --distance $distance --obeserved_ratio $ratio --batch_size 8" | awk '{print $4}')
    done
done