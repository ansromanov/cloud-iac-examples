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
