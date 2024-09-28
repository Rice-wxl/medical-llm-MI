#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition gpu # Partition (queue) name
#SBATCH --gres=gpu:1 # Request 1 gpu
#SBATCH --nodes=1 # Number of nodes
#SBATCH --mem=48G
#SBATCH -J pytest_slow
#SBATCH -o pytest_slow.out
#SBATCH -e pytest_slow.out

module load cuda
module load miniconda3/23.11.0s
source /oscar/runtime/software/external/miniconda3/23.11.0/etc/profile.d/conda.sh

conda activate ACDC

cd ..
pytest -s -m slow
