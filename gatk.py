#!/bin/env python

'''
usage:
 ipsych-gatk (--fqlist=FILE | --bamlist=FILE) --out=PREFIX [options]

options:
 --fqlist=FILE     fastq list
 --bamlist=FILE    bam list
 --out=PREFIX      output name prefix
 --chr=NUMBER      chromosome number, by default all chromosomes will be processed
 --nojob           nojob
 --dry-run         dry run

'''
from docopt import docopt
import sys
import os, errno
from os.path import basename
import subprocess
import json
from re import sub

arguments = docopt(__doc__)
outname = arguments['--out']
sdir = sys.path[0]

if arguments['--chr'] is None:
    chr_list = list(range(1,23)) + ['X','Y']
else:
    chr_list = arguments['--chr'].split(",")

if arguments['--fqlist'] is not None:
    gvcflist = [x.strip() for x in list(open(arguments['--fqlist']))]
    gvcflist = [sub(".fq1$","",i) for i in gvcflist]
    d = {}
    for i in gvcflist:
        d[basename(i)] = [i+".fq1",i+".fq2"]
    arguments['gvcflist'] = d
    with open(f"{outname}.snake","w") as outfile:
        outfile.write(f"include: '{sdir}/bwa.snake' \n")
        outfile.write(f"include: '{sdir}/picard.snake' \n")
        outfile.write(f"include: '{sdir}/gatk_pre.snake' \n")
        outfile.write(f"include: '{sdir}/combine_gvcf.snake' \n \n")
        outfile.write(f"rule {outname}_all:\n")
        outfile.write("\t input:")
        for i in chr_list:
            outfile.write(f"'{outname}.chr_{i}.vcf',")
        if arguments['--chr'] is None:
            outfile.write(f"'{outname}.chr_MT.vcf'")
else:
    gvcflist = [x.strip() for x in list(open(arguments['--bamlist']))]
    gvcflist = [sub(".bam$","",i) for i in gvcflist]
    d = {}
    for i in gvcflist:
        d[basename(i)] = [i+".bam"]
    arguments['gvcflist'] = d
    with open(f"{outname}.snake","w") as outfile:
        outfile.write(f"include: '{sdir}/bamtosam.snake' \n")
        outfile.write(f"include: '{sdir}/picard.snake' \n")
        outfile.write(f"include: '{sdir}/gatk_pre.snake' \n")
        outfile.write(f"include: '{sdir}/combine_gvcf.snake' \n \n")
        outfile.write(f"rule {outname}_all:\n")
        outfile.write("\t input:")
        for i in chr_list:
            outfile.write(f"'{outname}.chr_{i}.vcf',")
        if arguments['--chr'] is None:
            outfile.write(f"'{outname}.chr_MT.vcf'")



with open(f'{outname}.config.json', 'w') as outfile:
        json.dump(arguments, outfile, indent=4)


jobscript = f"#!/bin/bash \n" \
            f"source /com/extra/samtools/LATEST/load.sh \n" \
            f"source /com/extra/bwa/LATEST/load.sh \n" \
            f"source /com/extra/picard/2.7.1/load.sh \n" \
            f"source /com/extra/R/3.3/load.sh \n" \
            f"source /com/extra/GATK/LATEST/load.sh \n" \
            f"source /com/extra/Java/8/load.sh \n" \
            f"export _JAVA_OPTIONS='-Xms8G -Xmx8G' \n"

if arguments['--nojob'] or arguments['--dry-run']:
    with open(f"{outname}.master.sh","w") as outfile:
        outfile.write(jobscript)
        if arguments['--dry-run']:
            outfile.write(f"snakemake -j 999 -s {outname}.snake --configfile {outname}.config.json -n")
        else:
            outfile.write(f"snakemake -s {outname}.snake --configfile {outname}.config.json")
    if not arguments['--dry-run']:
        subprocess.call(["sh",outname + ".master.sh"])
    else:
        subprocess.call(["sh",outname +".master.sh"])

else:
    with open(f"{outname}.master.sh","w") as outfile:
        outfile.write(jobscript)
        outfile.write(f"snakemake -j 1000000 -s {outname}.snake --configfile {outname}.config.json --cluster-config {sys.path[0]}/gatk.cluster.json \
    --cluster 'sbatch --mem={{cluster.mem}} -c {{cluster.cores}} --time={{cluster.time}} -e {outname}.err -o {outname}.out'")
    subprocess.call(["sbatch","--time=12:00:00",outname+".master.sh"])


