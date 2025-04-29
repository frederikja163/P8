#!/bin/bash

#SBATCH --job-name=train_update        # Name of your job
#SBATCH --output=6train_update.out     # Name of the output file
#SBATCH --error=6train_update.err      # Name of the error file
#SBATCH --mem=24G                      # Memory
#SBATCH --cpus-per-task=15             # CPUs per task
#SBATCH --gres=gpu:1                   # Allocated GPUs
#SBATCH --time=01:00:00                # Maximum run time

singularity exec --nv --bind ..:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/runpython.sh "train_update.py $1"
