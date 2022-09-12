resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = merge(var.tags,
    {
      Name = var.name
    }
  )
}
