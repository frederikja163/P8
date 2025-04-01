#!/bin/bash

#SBATCH --job-name=porto_job  	# Name of your job
#SBATCH --output=porto_job.out  # Name of the output file
#SBATCH --error=porto_job.err 	# Name of the error file
#SBATCH --mem=24G               # Memory
#SBATCH --cpus-per-task=15      # CPUs per task
#SBATCH --gres=gpu:1            # Allocated GPUs
#SBATCH --time=01:00:00         # Maximum run time

srun singularity exec --bind /ceph/project/cs-25-sw-08-10/P8:/pytorchenv /ceph/container/pytorch/pytorch_25.02.sif /bin/bash -c "source /pytorchenv/bin/activate && python "
