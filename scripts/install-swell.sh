#!/usr/bin/env bash

set -euxo pipefail

# Set default value to `LOCAL_$(RANDOM) if unset`
: "${GITHUB_RUN_ID:=LOCAL_$RANDOM}"
export GITHUB_RUN_ID

# Set default value to current working directory
: "${GITHUB_WORKSPACE:=$PWD}"
export GITHUB_WORKSPACE

# Make experiment directory
mkdir /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}

# Copy and source modules
cp ${GITHUB_WORKSPACE}/src/swell/deployment/platforms/nccs_discover/modules /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/
source /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/modules
pip install --prefix=/discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/swell -r ${GITHUB_WORKSPACE}/requirements.txt --no-cache-dir ${GITHUB_WORKSPACE}

# Remove source code (needed to ensure nothing relies on the source)
