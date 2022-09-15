resource "aws_route53_record" "a" {
  name    = var.name
  type    = "A"
  zone_id = var.route53_zone_id
  ttl     = var.ttl
  records = var.records
}

resource "aws_route53_record" "cname" {
  count = var.create_cname ? 1 : 0

  name    = "${var.name}-cname"
  type    = "CNAME"
  zone_id = var.route53_zone_id
  ttl     = var.ttl
  records = aws_route53_record.a.records
}
