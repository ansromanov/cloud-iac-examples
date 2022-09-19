variable "name" {
  description = "Instance name"
  type        = string
}

variable "ami" {
  description = "Instance AMI"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(any)
}

variable "create_dns_records" {
  description = "If need to create DNS records"
  type        = bool
}

variable "route53_zone_id" {
  description = "Route 53 zone id"
  type        = string
}
variable "route53_ttl" {
  description = "Route 53 records TTL"
  type        = string
}
