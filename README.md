# Example of a MATLAB repository

[![codecov](https://codecov.io/github/mwakok/matlab-example/graph/badge.svg?token=OAKWZ3BQ3R)](https://codecov.io/github/mwakok/matlab-example)
[![Generate Test and Coverage Artifacts](https://github.com/mwakok/matlab-example/actions/workflows/testing.yml/badge.svg)](https://github.com/mwakok/matlab-example/actions/workflows/testing.yml)
[![documentation](https://github.com/mwakok/matlab-example/actions/workflows/docs.yml/badge.svg)](https://github.com/mwakok/matlab-example/actions/workflows/docs.yml)

This repository demonstrates the use of GitHub Actions to:
- Run tests
- Generate code coverage report for Pull Requests
- Build and deploy documentation


## Matlab addons
Additional addons can be installed through GitHub Actions. For the syntax of the available addons, see the [reference of MPM input files](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/dc71095be4c0462428922791044597e1e666542f/mpm-input-files/R2024a/mpm_input_r2024a.txt#L62).

Note, not all Addons are available through GitHub Actions. Check current limitations at [MPM limitations](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/MPM.md#limitations)