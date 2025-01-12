terraform {
  backend "s3" {
    bucket = "tfaction-sample-prd-s3-tfstate"
    key    = "main/terraform.tfstate"
    region = "ap-northeast-1"
  }
}