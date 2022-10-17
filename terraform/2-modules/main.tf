locals {
  project = "devops-iac-report"
  app     = "terraform-modules"
  owner   = "andrei.romanov"
  env     = "dev"
  prefix  = "${local.project}-${local.app}-${local.env}"

  region        = "eu-central-1"
  cidr_block    = "10.27.226.0/23"
  instance_type = "t3.micro"
  route53_ttl   = "1200"

  tags = {
    Project     = local.project
    Environment = local.env
    App         = local.app
    Owner       = local.owner
    Managed_by  = "Terraform"
  }
}

module "vpc" {
  source = "../modules/aws-vpc"

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

module "ec2-az1" {
  count  = 2
  source = "../modules/aws-ec2-instance"

  name          = "server-${local.region}a-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  subnet_id     = module.vpc.subnets["${local.prefix}-${local.region}a"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = local.route53_ttl
  route53_zone_id    = module.vpc.dns_zone[0].id
}

module "ec2-az2" {
  count  = 2
  source = "../modules/aws-ec2-instance"

  name          = "server-${local.region}b-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  subnet_id     = module.vpc.subnets["${local.prefix}-${local.region}b"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = local.route53_ttl
  route53_zone_id    = module.vpc.dns_zone[0].id
}
