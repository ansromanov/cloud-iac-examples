# Terraform infrastructure example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.27.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53_record"></a> [route53\_record](#module\_route53\_record) | ./modules/aws-route53-record | n/a |
| <a name="module_route53_zone"></a> [route53\_zone](#module\_route53\_zone) | ./modules/aws-route53-zone | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/aws-vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_records"></a> [dns\_records](#input\_dns\_records) | Route53 records map | <pre>map(object({<br>    route53_zone = string<br>    ip_address   = string<br>    ttl          = string<br>    create_cname = bool<br>  }))</pre> | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_route53_zones"></a> [route53\_zones](#input\_route53\_zones) | Route53 zones map | <pre>map(object({<br>    type = string<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | AWS VPC cidr | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
