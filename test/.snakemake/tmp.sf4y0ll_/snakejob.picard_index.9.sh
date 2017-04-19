#!/bin/sh
# properties = {"rule": "picard_index", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.dedup.bam", "priority_indv_files/cigar-test/.cigar-test.dedup.bam.ok"], "output": ["priority_indv_files/cigar-test/cigar-test.dedup.bai", "priority_indv_files/cigar-test/.cigar-test.dedup.bai.ok"], "params": {}, "threads": 1, "resources": {}, "jobid": 9, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "1"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.dedup.bai priority_indv_files/cigar-test/.cigar-test.dedup.bai.ok --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.dedup.bam priority_indv_files/cigar-test/.cigar-test.dedup.bam.ok /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules picard_index  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/9.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/9.jobfailed"; exit 1)

