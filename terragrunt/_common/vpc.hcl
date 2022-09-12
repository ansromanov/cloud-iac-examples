terraform {
  source = "${dirname(find_in_parent_folders())}/../terraform/modules//aws-vpc"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.environment
  project_name     = local.environment_vars.locals.project_name
}

inputs = {
  name     = "${local.project_name}-${local.env}"
  vpc_cidr = "10.27.224.0/23"
  tags = {
    Owner = "andrei.romanov"
  }
}
