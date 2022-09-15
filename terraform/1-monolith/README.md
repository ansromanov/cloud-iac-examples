# This code shows an example of monolith Terraform architecture pattern

Deploys EC2 instance into newly created VPC

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.server](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/instance) | resource |
| [aws_route53_record.server](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/route53_record) | resource |
| [aws_route53_record.server_cname](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/route53_zone) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/subnet) | resource |
| [aws_vpc.private](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/vpc) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
