#!/bin/sh
# properties = {"rule": "gatk_gvcf_step1", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.chr_22.recal.bam", "priority_indv_files/cigar-test/cigar-test.chr_22.recal.bai", "/data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta"], "output": ["priority_indv_files/cigar-test/cigar-test.chr_22.rawGvcf", "priority_indv_files/cigar-test/cigar-test.chr_22.rawGvcf.idx"], "params": {"padding": "100"}, "threads": 1, "resources": {}, "jobid": 3, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "4"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.chr_22.rawGvcf priority_indv_files/cigar-test/cigar-test.chr_22.rawGvcf.idx --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.chr_22.recal.bam priority_indv_files/cigar-test/cigar-test.chr_22.recal.bai /data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules gatk_gvcf_step1  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/3.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/3.jobfailed"; exit 1)

