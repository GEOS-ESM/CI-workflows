#!/usr/bin/env bash

github_run_id() {
  # Set default value to `LOCAL_$(uuidgen) if unset`
  : "${GITHUB_RUN_ID:=LOCAL_$RANDOM}"
  export GITHUB_RUN_ID
}

github_workspace() {
  # Set default value to current working directory
  : "${GITHUB_WORKSPACE:=$PWD}"
  export GITHUB_WORKSPACE
}

github_variables() {
  github_run_id
  github_workspace
}
