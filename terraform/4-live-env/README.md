# Terraform live infrastructure representation

This code shows an example of live Terraform environment pattern, where all applications in all environments are keeped separately in tree-defined structure.

Symlinks and Makefiles are used to reduce amount of copy-pasta and automation.

This pattern allows us to me

Deploys several EC2 instances in two AZs into newly created VPC to both environments.

Things to consider:
- managing symlinks and Makefiles are very error-prone
- still lot of duplicated Terraform code
- lack of orchestration, need to manage dependencies manually

How to deploy:

```shell
# dev env
cd env/dev/eu-central-1/vpc
make apply
cd env/dev/eu-central-1/app
make apply

# prod env
cd env/prod/eu-central-1/vpc
make apply
cd env/prod/eu-central-1/app
make apply
```

How to destroy:

```shell
# dev env
cd env/dev/eu-central-1/app
make destroy
cd env/dev/eu-central-1/vpc
make destroy

# prod env
cd env/prod/eu-central-1/app
make destroy
cd env/prod/eu-central-1/vpc
make destroy
```
