#!/bin/sh
# properties = {"rule": "gatk_apply", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bam", "priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bai", "priority_indv_files/cigar-test/.cigar-test.chr_22.realigned.bam.ok", "/data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta", "priority_indv_files/cigar-test/cigar-test.chr_22.recal.table"], "output": ["priority_indv_files/cigar-test/cigar-test.chr_22.recal.bam", "priority_indv_files/cigar-test/cigar-test.chr_22.recal.bai"], "params": {}, "threads": 1, "resources": {}, "jobid": 5, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "4"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.chr_22.recal.bam priority_indv_files/cigar-test/cigar-test.chr_22.recal.bai --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bam priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bai priority_indv_files/cigar-test/.cigar-test.chr_22.realigned.bam.ok /data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta priority_indv_files/cigar-test/cigar-test.chr_22.recal.table /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules gatk_apply  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/5.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/5.jobfailed"; exit 1)

