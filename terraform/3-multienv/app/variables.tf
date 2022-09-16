variable "region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "route53_ttl" {
  description = "Default Route53 TTL"
  type        = string
}
