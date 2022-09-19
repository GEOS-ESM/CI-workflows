#!/bin/bash

#SBATCH --job-name=jedi_build
#SBATCH --account=g0613
#SBATCH --time=01:30:00
#SBATCH --partition=preops
#SBATCH --qos=dastest
#SBATCH --ntasks=28
#SBATCH --export=NONE
#SBATCH --constraint=sky
#SBATCH --output=$CI_WORKSPACE/jedi_build/build.output

ulimit -s unlimited

jedi_bundle make jedi_build.yaml
