# ipsych-GATK
Run GATK Exome best practice workflow in iPSYCH

# Installation

Create a new environment

```
conda create -n snakemake python=3.6 anaconda
```

Acticate the environment
```
source activate snakemake
```

Download the snakemake latest repo

```
wget https://bitbucket.org/snakemake/snakemake/get/04630a43e225.zip
```

Unzip and cd in to the folder. then run `python setup.py install`

Install docopt `pip install docopt`

Clone the repository `git clone https://github.com/drveera/ipsych-GATK.git` 

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
