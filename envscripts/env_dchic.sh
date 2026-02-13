#!/bin/sh

#SBATCH --job-name=env_dchic
#SBATCH --partition=cpuq
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=job_name_%j.log
#SBATCH --mem=10G


conda env create -f ./packages/dchic.yml

#conda env create --yes --name eagleC python=3.8
#conda create -n HiCtrans R r-data.table r-hashmap r-changepoint r-optparse r-rcpp r-caatools r-depmixs4 r-deoptimr

# Restart your terminal, then run:
source ~/miniconda3/bin/activate dchic



Rscript -e 'plist <- c("functionsdchic","hashmap","R.utils","Rcpp","RcppEigen","BH","optparse","bench","bigstatsr","bigreadr","robust","data.table","networkD3","depmixS4","rjson","limma","ggplot2","lpsymphony","IHW"); setdiff(plist,basename(find.package(plist)))'
