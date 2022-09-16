terraform {
  backend "s3" {
    bucket         = "tfstate-devops-iac-report"
    key            = "terraform/4-live-env/dev/vpc.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-locks"
  }
}
