#!/bin/sh

#SBATCH --job-name=remove_conda
#SBATCH --partition=cpuq
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --output=job_name_%j.log
#SBATCH --mem=10G

conda env remove --yes --name dchic
#conda env create --yes -f /group/bienko/user_folders/dulce.montero/R4.yml

#   {[d[][]]} dahkld 000 == === || |- -| |= |=| =| |= *** * ** ****
## ### # # ############### ## 
# GPSeq meetings, GPSeq score www wwwwww w w ww www v vv vvv vvvvvvvv
