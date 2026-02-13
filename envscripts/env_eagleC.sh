#!/bin/sh

#SBATCH --job-name=env_EagleC
#SBATCH --partition=cpuq
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=job_name_%j.log
#SBATCH --mem=20G


#conda create -n eagleC python=3.8
conda create --yes --name iced python=3.8
#conda create -n HiCtrans R r-data.table r-hashmap r-changepoint r-optparse r-rcpp r-caatools r-depmixs4 r-deoptimr

source ~/miniconda3/bin/activate iced

pip install --upgrade pip setuptools wheel Cython pybind11 numpy==1.23.5

pip install iced


python -c "import iced; print(iced.__version__)"


# Restart your terminal, then run:
### source ~/miniconda3/bin/activate eagleC

# # Step 3: Install mamba
# conda install mamba -n eagleC -c conda-forge

# # Step 4: Install required packages
# mamba install scikit-learn statsmodels matplotlib cooler pyBigWig pyensembl joblib=1.0.1 cython=0.29.24 "tensorflow<=2.11" -c conda-forge

# # Step 5: Install pip if not found
# conda install pip

# # Install EagleC
# pip install eaglec

# # Step 6: Verify installation
# eaglec --version

