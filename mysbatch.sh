#!/bin/sh

echo "$@" >> sbatch.dump
sbatch $@ 
