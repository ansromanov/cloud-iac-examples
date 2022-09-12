terraform {
  backend "s3" {
    bucket         = "devops-iac-report-821777760736"
    key            = "terraform/infra.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-locks-devops-iac-report"
  }
}
