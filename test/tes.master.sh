#!/bin/bash 
source /com/extra/samtools/LATEST/load.sh 
source /com/extra/bwa/LATEST/load.sh 
source /com/extra/picard/2.7.1/load.sh 
source /com/extra/R/3.3/load.sh 
source /com/extra/GATK/LATEST/load.sh 
source /com/extra/Java/8/load.sh 
export _JAVA_OPTIONS='-Xms8G -Xmx8G' 
snakemake -j 1000000 -s tes.snake --configfile tes.config.json --cluster-config /faststorage/home/veera/pipelines/ipsych-GATK/gatk.cluster.json     --cluster 'sbatch --mem={cluster.mem} -c {cluster.cores} --time={cluster.time} -e tes.err -o tes.out'