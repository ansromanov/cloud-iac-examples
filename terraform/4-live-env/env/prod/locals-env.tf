locals {
  env = "prod"

  tags_env = {
    Environment = local.env
  }
}
