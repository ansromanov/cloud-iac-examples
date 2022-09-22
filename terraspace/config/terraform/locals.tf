locals {
  aws_account = "<%= expansion(':ACCOUNT') %>"
  aws_region  = "<%= expansion(':REGION') %>"
  project     = "devops-iac-report"
  app         = "terraspace-live"
  module      = "<%= expansion(':MOD_NAME') %>"
  environment = "<%= Terraspace.env %>"

  prefix = "${local.app}-${local.module}-${local.environment}"

  default_tags = {
    Project     = local.project
    Environment = local.environment
    App         = local.app
    Module      = local.module
    ManagedBy   = "Terraspace"
  }
}
