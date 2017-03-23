# ipsych-GATK
Run GATK Exome best practice workflow in iPSYCH

# Installation

If you already have conda genie environment, then just activate it
```
source activate genie
```
otherwise
```
conda create -n genie python=3.6 docopt=0.6.2 
source activate genie 
pip install --cert /com/etc/ssl-proxy-cert.pem snakemake==3.11.2
```
then,

Clone the current repository `git clone https://github.com/drveera/ipsych-GATK.git` 

cd in to the repo folder `cd ipsych-GATK`

Add an alias to the pipeline script to your `.bashrc` file
```
echo "alias ipsych-gatk='$PWD/gatk.py'" >> ~/.bashrc
source ~/.bashrc
```

# Running the pipeline

## Start with FASTQ files

```
ipsych-GATK --fastqlist=FILE --out=NAME

```

## Start with BAM files

```
ipsych-GATK --bamlist=FILE --out=NAME

```
