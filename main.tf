# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    organization = "firsttest-poc"

    workspaces {
      prefix = "netmemo-"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "ayushi-tf-dev-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
