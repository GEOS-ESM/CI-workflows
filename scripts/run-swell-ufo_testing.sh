#!/usr/bin/env bash

set -euxo pipefail

CI_WORKSPACE=/discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}
SUITE_NAME=ufo_testing
CI_WORKSPACE_JOB=/discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/${SUITE_NAME}
EXPERIMENT_ID=swell-${SUITE_NAME}-${GITHUB_RUN_ID}

mkdir -p $CI_WORKSPACE_JOB

source /discover/nobackup/gmao_ci/swell/tier1/${GITHUB_RUN_ID}/modules

# Get python version
PYVER=`python --version | awk '{print $2}' | awk -F. '{print $1"."$2}'`

export PATH=$CI_WORKSPACE/swell/bin:$PATH
export PYTHONPATH=${PYTHONPATH}:$CI_WORKSPACE/swell/lib/python$PYVER/site-packages

echo "experiment_id: $EXPERIMENT_ID" > $CI_WORKSPACE_JOB/${SUITE_NAME}-override.yaml
echo "experiment_root: $CI_WORKSPACE_JOB" >> $CI_WORKSPACE_JOB/${SUITE_NAME}-override.yaml

rm -r -f $HOME/cylc-run/${EXPERIMENT_ID}-suite

cd $CI_WORKSPACE_JOB
swell create ${SUITE_NAME} -m defaults -p nccs_discover -o $CI_WORKSPACE_JOB/${SUITE_NAME}-override.yaml
swell launch $CI_WORKSPACE_JOB/${EXPERIMENT_ID}/${EXPERIMENT_ID}-suite --no-detach --log_path $CI_WORKSPACE_JOB/${EXPERIMENT_ID}
