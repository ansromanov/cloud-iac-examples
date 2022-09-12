<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.30.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_cname"></a> [create\_cname](#input\_create\_cname) | If need to create cname | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | dns record name | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | dns zone records | `list(string)` | n/a | yes |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | route53 zone id | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(any)` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | ttl for dns record | `string` | `"1000"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_record"></a> [a\_record](#output\_a\_record) | n/a |
| <a name="output_cname_record"></a> [cname\_record](#output\_cname\_record) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
