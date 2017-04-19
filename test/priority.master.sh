#!/bin/bash 
source /com/extra/samtools/LATEST/load.sh 
source /com/extra/bwa/LATEST/load.sh 
source /com/extra/picard/2.7.1/load.sh 
source /com/extra/R/3.3/load.sh 
source /com/extra/GATK/LATEST/load.sh 
source /com/extra/Java/8/load.sh 
export _JAVA_OPTIONS='-Xms8G -Xmx8G' 
snakemake -j 1000000 --notemp --immediate-submit --nolock -s priority.snake --configfile priority.config.json --cluster-config /faststorage/home/veera/pipelines/ipsych-GATK/gatk.cluster.json         --cluster '/faststorage/home/veera/pipelines/ipsych-GATK/mybatch.py --mem {cluster.mem} --cores {cluster.cores} --time {cluster.time} --error priority.err --stdout         priority.out --project-name ADHD_Lubeck {dependencies}'