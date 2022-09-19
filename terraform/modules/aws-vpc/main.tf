resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = merge(var.tags,
    {
      Name = var.name
    }
  )
}

resource "aws_subnet" "private" {
  for_each = var.subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(var.tags, {
    Name = each.key
  })
}

resource "aws_route53_zone" "private" {
  count = var.create_private_dns_zone ? 1 : 0

  name    = var.dns_zone_name
  comment = "Created by aws-vpc module"
  vpc {
    vpc_id = aws_vpc.this.id
  }

  tags = var.tags
}
