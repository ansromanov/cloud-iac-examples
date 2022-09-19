include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/../modules//app"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env              = local.environment_vars.locals.environment
  region           = local.region_vars.locals.aws_region
  module           = basename(get_terragrunt_dir())
}

inputs = {
  instance_count = 2
  instance_type  = "t3.micro"
  subnet_ids = [
    dependency.vpc.outputs.subnets["devops-iac-report-terragrunt-live-vpc-${local.env}-${local.region}a"].id,
    dependency.vpc.outputs.subnets["devops-iac-report-terragrunt-live-vpc-${local.env}-${local.region}b"].id
  ]

  create_dns_records = true
  route53_ttl        = 1000
  route53_zone_id    = dependency.vpc.outputs.dns_zone[0].id


  tags = {
    Owner  = "andrei.romanov"
    Module = local.module
  }
}
