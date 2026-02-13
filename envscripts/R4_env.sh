#!/bin/sh

#SBATCH --job-name=create_R4
#SBATCH --partition=cpuq
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=R4_ENV_CONDA_%j.log
#SBATCH --mem=42G



# conda env create -f /bienko/user_folders/dulce.montero/env.yml