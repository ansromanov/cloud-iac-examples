# Docs: https://www.terraform.io/docs/providers/aws/index.html
#
# If AWS_PROFILE and AWS_REGION is set, then the provider is optional.  Here's an example anyway:
provider "aws" {
  region = "<%= expansion(':REGION') %>"

  default_tags {
    tags = local.default_tags
  }

  allowed_account_ids = ["<%= expansion(':ACCOUNT') %>"]
}
