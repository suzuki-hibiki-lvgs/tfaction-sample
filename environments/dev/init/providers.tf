provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      created_by = "hibiki-suzuki"
      managed_by = "terraform"
    }
  }
}