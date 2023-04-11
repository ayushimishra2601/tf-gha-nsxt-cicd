locals {
  namespace   = "mantra-stockx-blogs"
  environment = "staging"
}

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }

  backend "remote" {
    organization = "firsttest-poc"

    workspaces {
      prefix = "netmemo-"
    }
  }
}

module "cdn-about" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.86.0"

  namespace   = local.namespace
  environment = local.environment
  name        = "about-uploads"
  aliases     = []

  cloudfront_access_logging_enabled = false
  versioning_enabled                = true
}
