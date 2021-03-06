#!/bin/sh
# properties = {"rule": "gatk_realign_indel", "local": false, "input": ["priority_indv_files/cigar-test/cigar-test.dedup.bam", "priority_indv_files/cigar-test/.cigar-test.dedup.bam.ok", "priority_indv_files/cigar-test/cigar-test.dedup.bai", "priority_indv_files/cigar-test/.cigar-test.dedup.bai.ok", "/data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta", "/data/refseq/tooldata/GATKbundle/2.8/b37/Mills_and_1000G_gold_standard.indels.b37.vcf"], "output": ["priority_indv_files/cigar-test/cigar-test.chr_22.realignment.targets.list", "priority_indv_files/cigar-test/.cigar-test.chr_22.realignment.targets.list.ok"], "params": {"padding": "100"}, "threads": 1, "resources": {}, "jobid": 8, "cluster": {"time": "12:00:00", "mem": "16g", "cores": "4"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_indv_files/cigar-test/cigar-test.chr_22.realignment.targets.list priority_indv_files/cigar-test/.cigar-test.chr_22.realignment.targets.list.ok --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_indv_files/cigar-test/cigar-test.dedup.bam priority_indv_files/cigar-test/.cigar-test.dedup.bam.ok priority_indv_files/cigar-test/cigar-test.dedup.bai priority_indv_files/cigar-test/.cigar-test.dedup.bai.ok /data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta /data/refseq/tooldata/GATKbundle/2.8/b37/Mills_and_1000G_gold_standard.indels.b37.vcf /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules gatk_realign_indel  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/8.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/8.jobfailed"; exit 1)

