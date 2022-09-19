include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${dirname(find_in_parent_folders())}/../modules//aws-vpc"
}

locals {
  common_vars      = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  env        = local.environment_vars.locals.environment
  project    = local.common_vars.locals.project
  app        = local.common_vars.locals.app
  module     = basename(get_terragrunt_dir())
  prefix     = "${local.project}-${local.app}-${local.module}-${local.env}"
  region     = local.region_vars.locals.aws_region
  cidr_block = "10.27.238.0/23"
}

inputs = {
  name     = "${local.project}-${local.env}"
  vpc_cidr = local.cidr_block
  subnets = {
    "${local.prefix}-${local.region}a" : {
      availability_zone = "${local.region}a"
      cidr_block        = cidrsubnet(local.cidr_block, 1, 0)
    }
    "${local.prefix}-${local.region}b" : {
      availability_zone = "${local.region}b"
      cidr_block        = cidrsubnet(local.cidr_block, 1, 1)
    }
  }

  create_private_dns_zone = true
  dns_zone_name           = "${local.env}.${local.app}.${local.project}.local"

  tags = {
    Owner  = "andrei.romanov"
    Module = local.module
  }
}
