locals {
  system = "levwell-tfaction-sample"
}

data "aws_caller_identity" "current" {}

module "s3_bucket_tfstate" {
  # Module source
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.2.2"
  # Module arguments
  bucket = "${local.system}-${var.env}-s3-tfstate"
  versioning = {
    enabled = true
  }
  lifecycle_rule = [
    {
      id                                     = "abort_incomplete_multipart"
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7
    }
  ]
  tags = {
    Name = "${local.system}-${var.env}-s3-tfstate"
  }
}

module "iam_assumable_role_oidc_github" {
  # Module source
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.48.0"
  # Module arguments
  create_role                    = true
  role_name                      = "OIDCGitHubIaCRole"
  provider_url                   = "https://token.actions.githubusercontent.com"
  oidc_fully_qualified_audiences = ["sts.amazonaws.com"]
  oidc_subjects_with_wildcards   = ["repo:suzuki-hibiki-lvgs/tfaction-sample:*"]
  inline_policy_statements = [
    {
      actions = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:HeadObject",
      ]
      effect    = "Allow"
      resources = ["${module.s3_bucket_tfstate.s3_bucket_arn}/*"]
    },
    {
      actions   = ["sts:AssumeRole"]
      effect    = "Allow"
      resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/lmc-dev-role-terraform"]
    }
  ]
  tags = {
    Name = "OIDCGitHubIaCRole"
  }
}