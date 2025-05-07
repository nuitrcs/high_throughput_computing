#!/bin/bash
#SBATCH -A e32680
#SBATCH -p short
#SBATCH -t 1:00:00
#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE
#SBATCH --mail-user= <YourEmail>
#SBATCH -N 1
#SBATCH -n 3
#SBATCH --mem-per-cpu=1gb
#SBATCH --export=NONE
#SBATCH -J MAC2_peakcalling 


module load MACS2

macs2 callpeak -t /projects/e32680/03_macspeakcalling_reference/01_bam/WT_REP1.mLb.clN.sorted.bam \
    -c /projects/e32680/03_macspeakcalling_reference/01_bam/WT_input_REP1.mLb.clN.sorted.bam \
    -f BAM -g mm \
    -n wt_sample1 \
    --outdir /projects/e32680/03_macspeakcalling_reference/<YourFolder>
