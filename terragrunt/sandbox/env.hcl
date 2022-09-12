locals {
  environment = basename(get_terragrunt_dir())
  # it is recommended to hardcode aws account id here
  aws_account_id = get_aws_account_id()
  # it is recommended to hardcode aws profile here
  #  aws_profile          = "sandbox"
  terraform_version    = "1.2.8"
  aws_provider_version = "4.29.0"
  project_name         = "infra-iac-report"
}
