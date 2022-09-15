variable "name" {
  description = "zone name"
  type        = string
}
variable "comment" {
  description = "zone comment"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
  default     = ""
}

variable "tags" {
  description = "tags"
  type        = map(any)
}
