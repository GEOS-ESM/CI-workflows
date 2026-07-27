# Test repository for CI Workflows

This repository contains reusable GitHub Actions workflows for the Swell test pipelines used on Discover.

## Swell workflow steps

### Tier 1 workflow (`.github/workflows/swell-tier1_application_discover.yml`)

1. Build a matrix of Swell suites to run in parallel.
2. Validate the workflow, check out the repository, and install the Swell Python environment.
3. Launch each suite in its own job using the matrix.
4. If a suite fails, rename its working directory to `<suite>_FAILED`.
5. Clean up the run directory and Cylc log directories.

### Tier 2 workflow (`.github/workflows/swell-tier2_application_discover.yml`)

1. Create a lock so only one tier-2 run proceeds at a time.
2. Install Swell and prepare a per-run workspace.
3. Build the JEDI bundle using the `jedi_bundle` module on Discover
4. Run the tier-2 application suites (`hofx`, `3dfgat_marine_cycle`, and `3dfgat_atmos`) against that build.
5. Run comparison jobs for the marine and atmosphere suites.
6. On success, update the stable pointer; on failure, mark failed work directories with `_FAILED`; and always clean up logs and output data.

## Contributing

Please check out our [contributing guidelines](CONTRIBUTING.md).

## License

All files are currently licensed under the Apache-2.0 license, see [`LICENSE`](LICENSE).
