#!/bin/bash

#SBATCH --job-name=jedi_build
#SBATCH --account=g0613
#SBATCH --time=04:00:00
#SBATCH --partition=preops
#SBATCH --qos=dastest
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --export=NONE
#SBATCH --constraint=sky
#SBATCH --output=$CI_WORKSPACE/jedi_build/build.output

ulimit -s unlimited

jedi_bundle configure make jedi_build.yaml
