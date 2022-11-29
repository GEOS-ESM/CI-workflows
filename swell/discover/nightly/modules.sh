# Module initialization
# ---------------------
source /usr/share/lmod/lmod/init/bash

# Purge modules
# -------------
module purge

# Git modules
# -----------
module load git
module load git-lfs

# Spack stack modules
# -------------------
module use /discover/swdev/jcsda/spack-stack/modulefiles
module load miniconda/3.9.7

# Set the JEDI bundle paths
# -------------------------
export PATH=$CI_WORKSPACE/jedi_bundle/bin:$PATH
export PYTHONPATH=${PYTHONPATH}:$CI_WORKSPACE/jedi_bundle/lib/python3.9/site-packages
