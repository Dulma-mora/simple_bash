#!/bin/bash

dwnld() {

    METADATA=${1}
    OUTDIR=${2}
    
    source "/home/${USER}/miniconda3/bin/activate" gt

    LINE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${METADATA})
   
    ACCESSION=$(echo $LINE | awk 'BEGIN{FS=OFS=","}{ print $1}') && echo "Accession Name: ${ACCESSION}"
    
    mkdir -p ${OUTDIR}/${ACCESSION}
    parallel-fastq-dump --split-files --gzip -s ${ACCESSION} -O ${OUTDIR}/${ACCESSION} -t 1 #4
    echo "done!"

}




### Setting Variables:
# Ideally we create a dir with the ID name, for instance PRJNA743686, but this is a mock script
# WORKDIR="/group/bienko/data/external/mouse_aneuploidy/PRJNA743686"
WORKDIR="/group/bienko/user_folders/dulce.montero/Tests/simple_bash/download_metadata"
METADATA="${WORKDIR}/metadata.csv"

### Selecting samples of interest:
NUMBER_OF_SAMPLES=$(cat ${METADATA}| wc -l)

### Define Output Directory, and create it if it does not exist
OUTDIR="${WORKDIR}/fastq" && mkdir -p -m 770 ${OUTDIR}
LOGS="${OUTDIR}/logs" && mkdir -p -m 770 ${LOGS}
#touch ${OUTDIR}/expected.reads.txt

### Path to the actual download-script.sh / max resources to be used during each job
CPU=1 ; MEM='3G'

### Exporting variables
export OUTDIR=${OUTDIR} && export CPU=${CPU} && export MEM=${MEM} && export METADATA=${METADATA}
export -f dwnld


### Printing a summary 
echo -e "Outdir: ${OUTDIR}\t${NUMBER_OF_SAMPLES} Samples" 
        

### For each line found in ${METADATA}, launching a job array with SLURM:
sbatch -n ${CPU} --mem=${MEM} --export=ALL --oversubscribe --array=1-${NUMBER_OF_SAMPLES}%10 \
 -e ${LOGS}/slurm-%x_%A_%a.txt -o ${LOGS}/slurm-%x_%A_%a.txt --wrap "dwnld ${METADATA} ${OUTDIR}"