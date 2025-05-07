module load bedtools
bedtools intersect -wo -f 0.3 -r   -a wt_sample1_peaks.narrowPeak -b wt_sample2_peaks.narrowPeak > /projects/e32680/<YourFolder>/wt_peaks_final.bed

