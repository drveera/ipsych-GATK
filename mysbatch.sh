#!/bin/sh

sbatch $@ | cut -f 4 -d " "
