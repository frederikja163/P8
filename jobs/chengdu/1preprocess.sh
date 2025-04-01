#!/bin/bash

#SBATCH --job-name=preprocess_chengdu  # Name of your job
#SBATCH --output=1out     # Name of the output file
#SBATCH --error=1err # Name of the error file
#SBATCH --mem=24G               # Memory
#SBATCH --cpus-per-task=15      # CPUs per task
#SBATCH --gres=gpu:8            # Allocated GPUs
#SBATCH --time=01:00:00         # Maximum run time

singularity exec --nv --bind /ceph/project/cs-25-sw-8-10/P8:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/preprocess_chengdu.sh
