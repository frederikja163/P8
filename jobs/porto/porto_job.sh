#!/bin/bash

#SBATCH --job-name=porto_job  	# Name of your job
#SBATCH --output=porto_job.out  # Name of the output file
#SBATCH --error=porto_job.err 	# Name of the error file
#SBATCH --mem=24G               # Memory
#SBATCH --cpus-per-task=15      # CPUs per task
#SBATCH --gres=gpu:1            # Allocated GPUs
#SBATCH --time=01:00:00         # Maximum run time

singularity exec --nv /ceph/container/pytorch/pytorch_25.02.sif python ./../MST-OATD-FORK-P8/preprocess/preprocess_porto.py
