locals {
  module = "vpc"
  owner  = "andrei.romanov"
  prefix = "${local.project}-${local.app}-${local.module}-${local.env}"

  cidr_block = "10.27.234.0/23"

  tags = merge(
    local.tags_common,
    local.tags_env,
    {
      Module = local.module
      Owner  = local.owner
    }
  )

}

module "vpc" {
  source = "../../../../../modules/aws-vpc"

  name     = local.prefix
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

  tags = local.tags
}
