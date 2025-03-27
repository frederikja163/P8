#!/bin/bash

#SBATCH --job-name=trainlabels_porto  # Name of your job
#SBATCH --output=5out     # Name of the output file
#SBATCH --error=5err # Name of the error file
#SBATCH --mem=24G               # Memory
#SBATCH --cpus-per-task=15      # CPUs per task
#SBATCH --gres=gpu:1            # Allocated GPUs
#SBATCH --time=01:00:00         # Maximum run time

singularity exec --nv --bind /ceph/project/cs-25-sw-8-10/P8:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/trainlabels_porto.sh
