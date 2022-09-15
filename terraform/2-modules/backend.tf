terraform {
  backend "s3" {
    bucket         = "tfstate-devops-iac-report"
    key            = "terraform/2-modules/infra.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-locks"
  }
}
