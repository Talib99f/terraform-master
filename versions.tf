terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket         = "replace-with-a-globally-unique-bucket-name"
    key            = "projects/terraform.tfstate"
    region         = var.aws_region
  }
}
