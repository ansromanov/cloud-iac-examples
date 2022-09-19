
variable "tags" {
  description = "Tags"
  type        = map(any)
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "app" {
  description = "Application"
  type        = string
}
variable "environment" {
  description = "AWS region"
  type        = string
}
variable "subnet_ids" {
  description = "Subnet ids"
  type        = list(string)
}
variable "instance_count" {
  description = "EC2 instance count"
  type        = number
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "create_dns_records" {
  description = "If create DNS records"
  type        = bool
}
variable "route53_ttl" {
  description = "Route53 ttl"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 zone id"
  type        = string
}
