variable "name" {
  description = "dns record name"
  type        = string
}

variable "route53_zone_id" {
  description = "route53 zone id"
  type        = string
}

variable "records" {
  description = "dns zone records"
  type        = list(string)
}

variable "ttl" {
  description = "ttl for dns record"
  type        = string
  default     = "1000"
}

variable "create_cname" {
  description = "If need to create cname"
  type        = bool
  default     = false
}

variable "tags" {
  description = "tags"
  type        = map(any)
}
