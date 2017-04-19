#!/bin/sh
# properties = {"rule": "cleansam", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.unclean.sam", "priority_indv_files/cigar-test/.cigar-test.unclean.sam.ok"], "output": ["priority_indv_files/cigar-test/cigar-test.cleanedsam", "priority_indv_files/cigar-test/.cigar-test.cleanedsam.ok"], "params": {}, "threads": 1, "resources": {}, "jobid": 13, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "1"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.cleanedsam priority_indv_files/cigar-test/.cigar-test.cleanedsam.ok --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.unclean.sam priority_indv_files/cigar-test/.cigar-test.unclean.sam.ok /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules cleansam  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/13.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/13.jobfailed"; exit 1)

