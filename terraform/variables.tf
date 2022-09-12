variable "environment" {
  #  description = "Environment to use"
  type = string
}

variable "vpc_cidr" {
  description = "AWS VPC cidr"
  type        = string
}

variable "route53_zones" {
  description = "Route53 zones map"
  type = map(object({
    type = string
  }))
}

variable "dns_records" {
  description = "Route53 records map"
  type = map(object({
    route53_zone = string
    ip_address   = string
    ttl          = string
    create_cname = bool
  }))
  default = {}
}
