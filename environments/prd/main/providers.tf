provider "aws" {
  region = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/TerraformExecutionRole"
  }
  default_tags {
    tags = {
      created_by = "falcon"
      managed_by = "terraform"
    }
  }
}