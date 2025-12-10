# InfraGuard Project
TEST TRIGGER
## What is InfraGuard?

InfraGuard is a DevSecOps solution that scans Infrastructure-as-Code (Terraform) to detect
misconfigurations and enforce security policies in the CI/CD pipeline.

It has two main workflows:

1. **InfraGuard IaC Scan (on push / PR)**
   - Runs Checkov on the `infra/` folder
   - Generates `scan_result.json` report
   - A Python script summarizes results and fails the build if High/Critical issues are found
   - This acts as a security gate in the CI/CD pipeline

2. **InfraGuard Drift Scan (scheduled daily)**
   - Runs every day at 07:00 UTC (and can be triggered manually)
   - Re-scans the latest Terraform code on `main`
   - Alerts the team by failing the workflow when High/Critical issues exist
   - Simulates continuous drift/security monitoring

## How to run locally

```bash
# Run Checkov on Terraform code
checkov -d infra/

# Save JSON report and summarize
checkov -d infra/ -o json > scan_result.json
python3 scripts/summarize_checkov.py scan_result.json
