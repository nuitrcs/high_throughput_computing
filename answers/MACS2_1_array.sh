#!/bin/bash
#SBATCH -A e32680
#SBATCH -p short
#SBATCH -t 1:00:00
#SBATCH --array=0-3
#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE
#SBATCH --mail-user= <YourEmail>
#SBATCH -N 1
#SBATCH -n 3
#SBATCH --mem-per-cpu=1gb
#SBATCH --export=NONE
#SBATCH --job-name="Peak_calling_\${SLURM_ARRAY_TASK_ID}" ## use the task id in the name of the job

# set variables
export SAMPLEDIR=/projects/e32680/03_macspeakcalling_reference/01_bam
export OUTDIR=

# read in list of samples and controls
IFS=$'\n' read -d '' -r -a samples < ./list_of_samples.txt
IFS=$'\n' read -d '' -r -a controls < ./list_of_controls.txt

# assign current sample and control
sample=${samples[$SLURM_ARRAY_TASK_ID]}
control=${controls[$SLURM_ARRAY_TASK_ID]}

module load MACS2

# run MACS2
macs2 callpeak -t $SAMPLEDIR/$sample \
    -c $SAMPLEDIR/$control \
    -f BAM -g mm \
    -n ${sample%%.*} \  
    --outdir $OUTDIR
