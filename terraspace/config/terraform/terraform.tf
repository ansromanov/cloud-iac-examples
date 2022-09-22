terraform {
  required_version = "<%= terraform_version %>"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<%= provider_version %>"
    }
  }
}
