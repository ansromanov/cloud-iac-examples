locals {
  instance_name = "server"
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_route53_record" "a" {
  count = var.create_dns_records ? 1 : 0

  name    = var.name
  type    = "A"
  zone_id = var.route53_zone_id
  ttl     = var.route53_ttl
  records = [aws_instance.this.private_ip]
}

resource "aws_route53_record" "cname" {
  count = var.create_dns_records ? 1 : 0

  name    = "${var.name}-cname"
  type    = "CNAME"
  zone_id = var.route53_zone_id
  ttl     = var.route53_ttl
  records = [aws_instance.this.private_dns]
}
