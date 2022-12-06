#!/bin/bash

#SBATCH --job-name=jedi_build
#SBATCH --account=g0613
#SBATCH --time=03:00:00
#SBATCH --qos=allnccs
#SBATCH --ntasks=21
#SBATCH --export=NONE
#SBATCH --constraint=sky
#SBATCH --output=$CI_WORKSPACE/jedi_build/build.output

ulimit -s unlimited

jedi_bundle configure make jedi_build.yaml
