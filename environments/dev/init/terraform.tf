terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.80.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "= 4.0.6"
    }
  }
  required_version = ">= 1.10"
}