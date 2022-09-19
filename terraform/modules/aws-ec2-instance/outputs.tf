output "instance" {
  value = aws_instance.this
}

output "dns_records" {
  value = [
    aws_route53_record.a,
    aws_route53_record.cname
  ]
}
