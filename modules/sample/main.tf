resource "aws_s3_bucket" "sample" {
  bucket        = "${var.system}-${var.env}-s3"
  force_destroy = true
  tags = {
    Flag = false
  }
}