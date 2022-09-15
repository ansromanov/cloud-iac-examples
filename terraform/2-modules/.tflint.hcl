config {
  format = "compact"
  plugin_dir = "~/.tflint.d/plugins"

  module = true
  force = false
  disabled_by_default = false

  varfile = ["terraform.tfvars"]
}

plugin "aws" {
    enabled = true
    version = "0.16.1"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
    deep_check = true
}
