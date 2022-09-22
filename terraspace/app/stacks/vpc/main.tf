locals {
  owner = "andrei.romanov"

  tags = merge(
    local.default_tags,
    {
      Owner = local.owner
    }
  )

}

module "vpc" {
  source = "../../modules/aws-vpc"

  name     = local.prefix
  vpc_cidr = var.cidr_block
  subnets = {
    "${local.prefix}-${local.aws_region}a" : {
      availability_zone = "${local.aws_region}a"
      cidr_block        = cidrsubnet(var.cidr_block, 1, 0)
    }
    "${local.prefix}-${local.aws_region}b" : {
      availability_zone = "${local.aws_region}b"
      cidr_block        = cidrsubnet(var.cidr_block, 1, 1)
    }
  }
  create_private_dns_zone = true
  dns_zone_name           = "${local.environment}.${local.app}.${local.project}.local"

  tags = local.tags
}
