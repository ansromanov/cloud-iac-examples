variable "vpc_cidr" {
  description = "AWS VPC cidr"
  type        = string
}

variable "name" {
  description = "VPC name"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(any)
}

variable "subnets" {
  description = "Subnets map"
  type = map(object({
    availability_zone = string
    cidr_block        = string
  }))
}

variable "create_private_dns_zone" {
  description = "If need to create private DNS zone"
  type        = bool
}

variable "dns_zone_name" {
  description = "DNS zone name"
  type        = string
}
