# This repository contain cloud infrastructure code examples

## Tools

DSL

- Terraform
  - [1-monolith](terraform/1-monolith) Example of monolith Terraform architecture pattern
  - [2-modules](terraform/2-modules) Example of monolith Terraform architecture that using separate modules as a building blocks
  - [3-multienv](terraform/3-multienv) Example of separated Terraform stacks that using previosly created modules as a building blocks
  - [4-live-env](terraform/4-live-env) Example of live Terraform environment pattern, where all applications in all environments are keeped separately in tree-defined structure
- Terragrunt
- Terraspace
- Terramate

Programming languages

- Cdktf
- Pulumi
