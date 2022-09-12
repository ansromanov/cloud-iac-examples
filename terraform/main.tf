locals {
  project = "devops-iac-report-${var.environment}"
  tags = {
    Owner       = "andrei.romanov"
    Project     = local.project
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}


module "vpc" {
  source = "./modules/aws-vpc"

  name     = local.project
  vpc_cidr = var.vpc_cidr
  tags     = local.tags
}

module "route53_zone" {
  source = "./modules/aws-route53-zone"

  for_each = var.route53_zones

  name    = each.key
  vpc_id  = each.value.type == "private" ? module.vpc.vpc.id : ""
  comment = "${local.project} record"
  tags    = local.tags

  depends_on = [module.vpc]
}

module "route53_record" {
  source = "./modules/aws-route53-record"

  for_each = var.dns_records

  name            = each.key
  records         = [each.value.ip_address]
  route53_zone_id = module.route53_zone[each.value.route53_zone].zone.id
  tags            = local.tags

  depends_on = [module.route53_zone]
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
