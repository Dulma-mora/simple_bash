#!/bin/sh

#SBATCH --job-name=activate_R4
#SBATCH --partition=cpuq
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=R4_ENV_CONDA_%j.log
#SBATCH --mem=42G


CONDA_ENVNAME="R4"
source "/home/${USER}/miniconda3/etc/profile.d/conda.sh"


if ! conda info --envs | grep -q "${CONDA_ENVNAME}"; then
    conda create -n ${CONDA_ENVNAME} --yes
fi

conda activate ${CONDA_ENVNAME}


conda install -y conda-forge::r-base
conda install -y jupyter r-data-table r-dplyr r-ggplot2 r-rtracklayer r-biocmanager r-dbplyr
conda install -y anaconda::jupyter


conda deactivate
