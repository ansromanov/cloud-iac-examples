
resource "aws_route53_zone" "this" {
  name    = var.name
  comment = var.comment

  dynamic "vpc" {
    for_each = var.vpc_id != "" ? [1] : []
    content {
      vpc_id = var.vpc_id
    }
  }

  tags = var.tags
}
