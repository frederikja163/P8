#!/bin/bash

#SBATCH --job-name=train_labels        # Name of your job
#SBATCH --output=5train_labels.out                 # Name of the output file
#SBATCH --error=5train_labels.err                  # Name of the error file
#SBATCH --mem=24G                     # Memory
#SBATCH --cpus-per-task=15            # CPUs per task
#SBATCH --gres=gpu:1                  # Allocated GPUs
#SBATCH --time=01:00:00               # Maximum run time

singularity exec --nv --bind ..:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/run_python.sh "train_labels.py $1"
