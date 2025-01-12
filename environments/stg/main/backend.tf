terraform {
  backend "s3" {
    bucket = "tfaction-sample-stg-s3-tfstate"
    key    = "main/terraform.tfstate"
    region = "ap-northeast-1"
  }
}