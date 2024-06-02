#!/usr/bin/env bash

set -euxo pipefail

source scripts/utils.sh
github_variables

# Make experiment directory
mkdir /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}

# Copy and source modules
cp ${GITHUB_WORKSPACE}/src/swell/deployment/platforms/nccs_discover/modules /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/
source /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/modules
pip install --prefix=/discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/swell -r ${GITHUB_WORKSPACE}/requirements.txt --no-cache-dir ${GITHUB_WORKSPACE}

# Remove source code (needed to ensure nothing relies on the source)
