variable "bucket" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name." # IE: terraform-2020052606510241590000000
  type        = string
  default     = null
}

variable "acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}
