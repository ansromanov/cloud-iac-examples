locals {
  project           = "devops-iac-report"
  app               = "terraform-multienv"
  module            = "app"
  owner             = "andrei.romanov"
  prefix            = "${local.project}-${local.app}-${local.module}-${var.env}"
  module_vpc_prefix = "${local.project}-${local.app}-vpc-${var.env}"

  tags = {
    Project     = local.project
    Environment = var.env
    App         = local.app
    Module      = local.module
    Owner       = local.owner
    Managed_by  = "Terraform"
  }
}


module "ec2-az1" {
  count  = 2
  source = "../../2-modules/modules/aws-ec2-instance"

  name          = "server-${var.region}a-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.vpc.subnets["${local.module_vpc_prefix}-${var.region}a"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = var.route53_ttl
  route53_zone_id    = data.terraform_remote_state.vpc.outputs.vpc.dns_zone[0].id
}

module "ec2-az2" {
  count         = 2
  source        = "../../2-modules/modules/aws-ec2-instance"
  name          = "server-${var.region}b-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.vpc.subnets["${local.module_vpc_prefix}-${var.region}b"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = var.route53_ttl
  route53_zone_id    = data.terraform_remote_state.vpc.outputs.vpc.dns_zone[0].id
}
