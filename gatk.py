#!/bin/env python

'''
usage:
 gseq gatk (--fqlist=FILE | --bamlist=FILE) --out=PREFIX

options:
 --fqlist=FILE     fastq list
 --bamlist=FILE    bam list
 --out=PREFIX      output name prefix

'''
from docopt import docopt
import sys
import os, errno
from os.path import basename
import subprocess
import json

arguments = docopt(__doc__)
outname = arguments['--out']
sdir = sys.path[0]


if arguments['--fqlist'] is not None:
    gvcflist = [x.strip() for x in list(open(arguments['--fqlist']))]
    for i in gvcflist:
        if os.path.lexists(basename(i)):
            os.remove(basename(i))
        os.symlink(i,basename(i))
    gvcflist = [x.replace(".fq1","") for x in gvcflist]
    arguments['gvcflist'] = [basename(x) for x in gvcflist]
    with open(f"{outname}.snake","w") as outfile:
        outfile.write(f"include: '{sdir}/bwa.snake' \n")
        outfile.write(f"include: '{sdir}/picard.snake' \n")
        outfile.write(f"include: '{sdir}/gatk_pre.snake' \n")
        outfile.write(f"include: '{sdir}/combine_gvcf.snake' \n \n")
        outfile.write(f"rule {outname}_all:\n")
        outfile.write("\t input: \n\t\t")
        for i in list(range(1,23)) + ['X','Y']:
            outfile.write(f"{outname}.chr_{i}.vcf,")
        outfile.write(f"{outname}.chr_MT.vcf")
else:
    gvcflist = [x.strip() for x in list(open(arguments['--bamlist']))]
    for i in gvcflist:
        if os.path.lexists(basename(i)):
            os.remove(basename(i))
        os.symlink(i,basename(i))
    gvcflist = [x.replace(".bam","") for x in gvcflist]
    arguments['gvcflist'] = [basename(x) for x in gvcflist]
    snake_file = sys.path[0] + "/exome.bam.snake"
    with open(f"{outname}.snake","w") as outfile:
        outfile.write(f"include: '{sdir}/bamtosam.snake' \n")
        outfile.write(f"include: '{sdir}/picard.snake' \n")
        outfile.write(f"include: '{sdir}/gatk_pre.snake' \n")
        outfile.write(f"include: '{sdir}/combine_gvcf.snake' \n \n")
        outfile.write(f"rule {outname}_all:\n")
        outfile.write("\t input:")
        for i in list(range(1,23)) + ['X','Y']:
            outfile.write(f"'{outname}.chr_{i}.vcf',")
        outfile.write(f"'{outname}.chr_MT.vcf'")



with open(f'{outname}.config.json', 'w') as outfile:
        json.dump(arguments, outfile, indent=4)

with open(f"{outname}.master.sh","w") as outfile:
    outfile.write("#!/bin/sh\n")
    outfile.write(f"snakemake -j 1000000 -s {outname}.snake --configfile {outname}.config.json --cluster-config {sys.path[0]}/gatk.cluster.json \
    --cluster 'sbatch --mem={{cluster.mem}} -c {{cluster.cores}} --time={{cluster.time}} -e {outname}.err -o {outname}.out'")
    
subprocess.call(["sbatch","--time=12:00:00",outname+".master.sh"])

