# Terraform stack that creates web application

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.27.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-az1"></a> [ec2-az1](#module\_ec2-az1) | ../../2-modules/modules/aws-ec2-instance | n/a |
| <a name="module_ec2-az2"></a> [ec2-az2](#module\_ec2-az2) | ../../2-modules/modules/aws-ec2-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/ami) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_route53_ttl"></a> [route53\_ttl](#input\_route53\_ttl) | Default Route53 TTL | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
