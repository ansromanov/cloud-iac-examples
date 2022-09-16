locals {
  project = "devops-iac-report"
  app     = "terraform-live-env"

  tags_common = {
    Project    = local.project
    App        = local.app
    Managed_by = "Terraform"
  }
}
