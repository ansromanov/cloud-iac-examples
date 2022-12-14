remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "${local.project}-terraform-state-${local.account_id}-${local.aws_region}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = "${local.project}-terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    variable "aws_default_tags" {
       type = map
    }

    provider "aws" {
      region = "${local.aws_region}"

      default_tags {
        tags = var.aws_default_tags
      }

      allowed_account_ids = ["${local.account_id}"]
    }

    terraform {
      required_version = "= ${local.terraform_version}"

      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "= ${local.aws_provider_version}"
        }
      }
    }
  EOF
}


locals {
  common_vars      = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  project              = local.common_vars.locals.project
  app                  = local.common_vars.locals.app
  environment          = local.environment_vars.locals.environment
  terraform_version    = local.environment_vars.locals.terraform_version
  account_id           = local.environment_vars.locals.aws_account_id
  aws_provider_version = local.environment_vars.locals.aws_provider_version
  aws_region           = local.region_vars.locals.aws_region
}

inputs = merge(
  local.common_vars.locals,
  local.environment_vars.locals,
  local.region_vars.locals,
  {
    aws_default_tags = {
      Project     = local.project
      Environment = local.environment
      App         = local.app
      Managed_by  = "Terragrunt"
    }
  },
)
