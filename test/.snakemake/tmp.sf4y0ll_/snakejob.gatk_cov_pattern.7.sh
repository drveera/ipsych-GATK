#!/bin/sh
# properties = {"rule": "gatk_cov_pattern", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bam", "priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bai", "priority_indv_files/cigar-test/.cigar-test.chr_22.realigned.bam.ok", "/data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta", "/data/refseq/tooldata/GATKbundle/2.8/b37/Mills_and_1000G_gold_standard.indels.b37.vcf", "/data/refseq/tooldata/GATKbundle/2.8/b37/dbsnp_138.b37.vcf"], "output": ["priority_indv_files/cigar-test/cigar-test.chr_22.recal.table", "priority_indv_files/cigar-test/.cigar-test.chr_22.recal.table.ok"], "params": {}, "threads": 1, "resources": {}, "jobid": 7, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "4"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.chr_22.recal.table priority_indv_files/cigar-test/.cigar-test.chr_22.recal.table.ok --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bam priority_indv_files/cigar-test/cigar-test.chr_22.realigned.bai priority_indv_files/cigar-test/.cigar-test.chr_22.realigned.bam.ok /data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta /data/refseq/tooldata/GATKbundle/2.8/b37/Mills_and_1000G_gold_standard.indels.b37.vcf /data/refseq/tooldata/GATKbundle/2.8/b37/dbsnp_138.b37.vcf /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules gatk_cov_pattern  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/7.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/7.jobfailed"; exit 1)

