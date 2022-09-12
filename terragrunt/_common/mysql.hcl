terraform {
  source = "${dirname(find_in_parent_folders())}/../terraform/modules//aws-rds-mysql"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.environment
  project_name     = local.environment_vars.locals.project_name
}

inputs = {
  db_name = "mysql-${local.env}"
  #  db_name           = "mysql-${local.project_name}-${local.env}"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "standard"
  master_username   = "admin"
  # TODO: To avoid storing your DB password in the code, set it as the environment variable TF_VAR_master_password
  # master_password = ""
  engine_version      = "5.7.38"
  skip_final_snapshot = true

  tags = {
    Owner = "andrei.romanov"
  }
}
