# Module initialization
# ---------------------
source /usr/share/lmod/lmod/init/bash

# Purge modules
# -------------
module purge

# Git modules
# -----------
module load git-lfs

# Spack stack modules
# -------------------
module use /discover/swdev/jcsda/spack-stack/modulefiles
module load miniconda/3.9.7
module load ecflow/5.8.4
module use /discover/swdev/jcsda/spack-stack/spack-stack-v1/envs/skylab-1.0.0-intel-2022.0.1/install/modulefiles/Core
module load stack-intel/2022.0.1
module load stack-intel-oneapi-mpi/2021.5.0
module load stack-python/3.9.7
module load jedi-ewok-env/1.0.0
module load jedi-fv3-env/1.0.0
module load nco/5.0.6

# Set the JEDI bundle paths
# -------------------------
export PATH=$CI_WORKSPACE/jedi_bundle/bin:$PATH
export PYTHONPATH=${PYTHONPATH}:$CI_WORKSPACE/jedi_bundle/lib/python3.9/site-packages
