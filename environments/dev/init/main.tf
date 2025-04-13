locals {
  system = "levwell-tfaction-sample"
}

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