# Terraform infrastructure with modules example

This code shows an example of separated Terraform stacks that using previosly created modules as a building blocks.

This pattern allows us to make reusable infrastructure that pretty simple to scale up, as showed for ec2 module.
Also we using separate backend to manage different environments

Things to consider:
- this pattern heavily relies on CI/CD orchestration
- difficult to manage environment-specific resources

How to init:

```shell
# dev env
terraform -chdir=vpc workspace new dev
terraform -chdir=vpc init
terraform -chdir=app workspace new dev
terraform -chdir=app init

# prod env
terraform -chdir=vpc workspace new prod
terraform -chdir=vpc init
terraform -chdir=app workspace new prod
terraform -chdir=app init
```

How to deploy:

```shell
# dev env
terraform -chdir=vpc workspace select dev
terraform -chdir=vpc apply -var-file=terraform-dev.tfvars
terraform -chdir=app workspace select dev
terraform -chdir=app apply -var-file=terraform-dev.tfvars

# prod env
terraform -chdir=vpc workspace select prod
terraform -chdir=vpc apply -var-file=terraform-prod.tfvars
terraform -chdir=app workspace select prod
terraform -chdir=app apply -var-file=terraform-prod.tfvars
```

How to destroy:

```shell
# dev env
terraform -chdir=app workspace select dev
terraform -chdir=app destroy -var-file=terraform-dev.tfvars
terraform -chdir=vpc workspace select dev
terraform -chdir=vpc destroy -var-file=terraform-dev.tfvars

# prod env
terraform -chdir=app workspace select prod
terraform -chdir=app destroy -var-file=terraform-prod.tfvars
terraform -chdir=vpc workspace select prod
terraform -chdir=vpc destroy -var-file=terraform-prod.tfvars
```
