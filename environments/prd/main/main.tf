locals {
  system = "tfaction-sample"
}

module "sample" {
  source = "../../../modules/sample"
  system = local.system
  env    = var.env
}