locals {
  project = "devops-iac-report"
  app     = "terraform-multienv"
  module  = "vpc"
  owner   = "andrei.romanov"
  prefix  = "${local.project}-${local.app}-${local.module}-${var.env}"



  tags = {
    Project     = local.project
    Environment = var.env
    App         = local.app
    Module      = local.module
    Owner       = local.owner
    Managed_by  = "Terraform"
  }
}

module "vpc" {
  source = "../../modules/aws-vpc"

  name     = local.prefix
  vpc_cidr = var.cidr_block
  subnets = {
    "${local.prefix}-${var.region}a" : {
      availability_zone = "${var.region}a"
      cidr_block        = cidrsubnet(var.cidr_block, 1, 0)
    }
    "${local.prefix}-${var.region}b" : {
      availability_zone = "${var.region}b"
      cidr_block        = cidrsubnet(var.cidr_block, 1, 1)
    }
  }
  create_private_dns_zone = true
  dns_zone_name           = "${var.env}.${local.app}.${local.project}.local"

  tags = local.tags
}
