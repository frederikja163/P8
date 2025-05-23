#!/bin/bash

#SBATCH --job-name=preproces           # Name of your job
#SBATCH --output=1preprocess.out       # Name of the output file
#SBATCH --error=1preprocess.err        # Name of the error file
#SBATCH --mem=140G                      # Memory
#SBATCH --cpus-per-task=30             # CPUs per task
#SBATCH --gres=gpu:1                   # Allocated GPUs
#SBATCH --time=04:00:00                # Maximum run time

singularity exec --nv --bind ..:/P8 /ceph/container/pytorch/pytorch_25.02.sif /bin/bash /P8/scripts/run_python.sh "preprocess_data.py $*" preprocess/
