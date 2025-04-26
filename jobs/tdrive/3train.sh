#!/bin/bash

#SBATCH --job-name=train_cd  # Name of your job
#SBATCH --output=3out     # Name of the output file
#SBATCH --error=3err # Name of the error file
#SBATCH --mem=24G               # Memory
#SBATCH --cpus-per-task=15      # CPUs per task
#SBATCH --gres=gpu:1            # Allocated GPUs
#SBATCH --time=02:00:00         # Maximum run time

singularity exec --nv --bind ../../../P8:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/train_cd.sh
