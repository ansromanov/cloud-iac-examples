terraform {
  backend "s3" {
    bucket         = "tfstate-devops-iac-report"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-locks"
  }
}
