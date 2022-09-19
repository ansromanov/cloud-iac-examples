locals {
  module            = "app"
  owner             = "andrei.romanov"
  prefix            = "${local.project}-${local.app}-${local.module}-${local.env}"
  module_vpc_prefix = "${local.project}-${local.app}-vpc-${local.env}"

  instance_type = "t3.micro"
  route53_ttl   = "1000"

  tags = merge(
    local.tags_common,
    local.tags_env,
    {
      Module = local.module
      Owner  = local.owner
    }
  )
}


module "ec2-az1" {
  count  = 2
  source = "../../../../../modules/aws-ec2-instance"

  name          = "${local.app}-${local.env}-server-${local.region}a-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.vpc.subnets["${local.module_vpc_prefix}-${local.region}a"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = local.route53_ttl
  route53_zone_id    = data.terraform_remote_state.vpc.outputs.vpc.dns_zone[0].id
}

module "ec2-az2" {
  count  = 2
  source = "../../../../../modules/aws-ec2-instance"

  name          = "${local.app}-${local.env}-server-${local.region}b-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.vpc.subnets["${local.module_vpc_prefix}-${local.region}b"].id
  tags          = local.tags

  create_dns_records = true
  route53_ttl        = local.route53_ttl
  route53_zone_id    = data.terraform_remote_state.vpc.outputs.vpc.dns_zone[0].id
}
