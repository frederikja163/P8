# Example usages: 

`sbatch 0setup_env.sh`

## Chengdu

`sbatch 1preprocess.sh "--dataset cd"`

`sbatch2generate_outliers.sh "--dataset cd"`

`sbatch 3train.sh "--dataset cd --batch_size 200"` lower batch_size because a large amount of the memory is reserved for loading the entire dataset (TODO)

`sbatch 4test.sh "--dataset cd"`

`sbtach 5train_labels.sh "--dataset cd"`

`sbatch 6train_update.sh "--dataset cd"`

## Porto

`sbatch 1preprocess.sh "--dataset porto"`

`sbatch 2generate_outliers.sh "--dataset porto"`

`sbatch 3train.sh "--dataset porto"`

`sbatch 4test.sh "--dataset porto"`

`sbatch 5train_labels.sh "--dataset porto"`

`sbatch 6train_update.sh "--dataset porto"`

## T-Drive

`sbatch 1preprocess.sh "--dataset tdrive --grid_size 0.3"` grid_size limited by RAM

`sbatch 2generate_outliers.sh "--dataset tdrive"`

`sbatch 3train.sh "--dataset tdrive --batch_size 200"` batch_size limited by GPU VRAM

`sbatch 4test.sh "--dataset tdrive"`

`sbatch 5train_labels.sh "--dataset tdrive"`

`sbatch 6train_update.sh "--dataset tdrive"`

## link jobs
`sbatch 1preprocess.sh "--dataset tdrive"`

outputs some job id 1234

`sbatch --dependency=afterok:1234 2generate_outliers.sh "--dataset tdrive"`
 

## Troubleshoot

if virtualenv package is failing in setupenv try

`# reinstall with srun singularity exec --nv /ceph/container/pytorch/pytorch_25.02.sif pip uninstall virtualenv`