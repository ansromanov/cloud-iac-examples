module "ec2-az1" {
  count  = var.instance_count
  source = "../aws-ec2-instance"

  name          = "${var.app}-${var.environment}-server-${var.aws_region}a-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]
  tags          = var.tags

  create_dns_records = var.create_dns_records
  route53_ttl        = var.route53_ttl
  route53_zone_id    = var.route53_zone_id
}


module "ec2-az2" {
  count  = var.instance_count
  source = "../aws-ec2-instance"

  name          = "${var.app}-${var.environment}-server-${var.aws_region}b-${count.index + 1}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[1]
  tags          = var.tags

  create_dns_records = var.create_dns_records
  route53_ttl        = var.route53_ttl
  route53_zone_id    = var.route53_zone_id
}
