output "vpc" {
  value = aws_vpc.this
}

output "subnets" {
  value = aws_subnet.private
}

output "dns_zone" {
  value = aws_route53_zone.private
}
