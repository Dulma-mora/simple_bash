#!/bin/sh

#SBATCH --job-name=create_condafitenv
#SBATCH --partition=cpuq
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=fithic_ENV_%j.log
#SBATCH --mem=13G

source ~/miniconda3/etc/profile.d/conda.sh

conda create --yes -n fithic

conda activate fithic

# Adding some channels for Bioconda (not necessary)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install --yes fithic

# source "/home/${USER}/miniconda3/bin/activate" ${CONDA_ENVNAME}
# source "/home/${USER}/miniconda3/bin/activate" R4