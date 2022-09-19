# Terraform infrastructure with modules example

This code shows an example of monolith Terraform architecture that using separate modules as a building blocks.

This pattern allows us to make reusable infrastructure that pretty simple to scale up, as showed for ec2 module.

Deploys several EC2 instances in two AZs into newly created VPC.

Things to consider:
- easily to start and deploy, good for prototyping
- same drawbacks as for monolith repository

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-az1"></a> [ec2-az1](#module\_ec2-az1) | ../modules/aws-ec2-instance | n/a |
| <a name="module_ec2-az2"></a> [ec2-az2](#module\_ec2-az2) | ../modules/aws-ec2-instance | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/aws-vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
