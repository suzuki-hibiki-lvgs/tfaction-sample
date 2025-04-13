provider "aws" {
  region = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/lmc-dev-role-terraform"
  }
  default_tags {
    tags = {
      created_by = "hibiki-suzuki"
      managed_by = "terraform"
    }
  }
}