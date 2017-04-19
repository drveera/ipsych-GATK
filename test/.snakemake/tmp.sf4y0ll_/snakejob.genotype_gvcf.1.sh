#!/bin/sh
# properties = {"rule": "genotype_gvcf", "local": false, "input": ["priority_merged_files/priority.chr_22.mergedGvcf", "/data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta"], "output": ["priority_merged_files/priority.chr_22.vcf"], "params": {}, "threads": 1, "resources": {}, "jobid": 1, "cluster": {"time": "720:00:00", "mem": "128g", "cores": "8"}}
cd /faststorage/home/veera/pipelines/ipsych-GATK/test && \
/home/veera/.conda/envs/genie/bin/python -m snakemake priority_merged_files/priority.chr_22.vcf --snakefile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.snake \
--force -j --keep-target-files --keep-shadow --keep-remote \
--wait-for-files priority_merged_files/priority.chr_22.mergedGvcf /data/refseq/tooldata/GATKbundle/2.8/b37/human_g1k_v37.fasta /faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_ --latency-wait 5 \
--benchmark-repeats 1 \
--force-use-threads --wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
 --configfile /faststorage/home/veera/pipelines/ipsych-GATK/test/priority.config.json  --nocolor \
--notemp --quiet --no-hooks --nolock --force-use-threads  --allowed-rules genotype_gvcf  && touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/1.jobfinished" || (touch "/faststorage/home/veera/pipelines/ipsych-GATK/test/.snakemake/tmp.sf4y0ll_/1.jobfailed"; exit 1)

