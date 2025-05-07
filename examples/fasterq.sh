#!/bin/bash

#SBATCH --account=b1042
#SBATCH --partition=genomics
#SBATCH --job-name=fqdump
#SBATCH --output=fqdump_job.%A_%a.out
#SBATCH --time=10:00:00
#SBATCH --mem=10G       ### edit this line to reserve more/less memory
#SBATCH --ntasks=1      ### edit this line to reserve different no. of cores
#SBATCH --nodes=1

module purge all
module load sratoolkit/3.0.0

fasterq-dump SRR378098
