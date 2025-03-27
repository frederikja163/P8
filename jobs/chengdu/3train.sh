#!/bin/bash

#SBATCH --job-name=train_chengdu  # Name of your job
#SBATCH --output=3out     # Name of the output file
#SBATCH --error=3err # Name of the error file
#SBATCH --mem=400G               # Memory
#SBATCH --cpus-per-task=120      # CPUs per task
#SBATCH --gres=gpu:1            # Allocated GPUs
#SBATCH --time=05:00:00         # Maximum run time

singularity exec --nv --bind /ceph/project/cs-25-sw-8-10/P8:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/train_chengdu.sh
