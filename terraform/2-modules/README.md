# Terraform infrastructure example

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
| <a name="module_ec2-az1"></a> [ec2-az1](#module\_ec2-az1) | ./modules/aws-ec2-instance | n/a |
| <a name="module_ec2-az2"></a> [ec2-az2](#module\_ec2-az2) | ./modules/aws-ec2-instance | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/aws-vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
