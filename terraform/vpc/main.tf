module "vpc" {
  source = "./module/vpc"

  cidr_block = "10.0.0.0/16"
  name       = "danylo-test-vpc"
}

module "aws_availability_zones" {
  source = "./module/availability_zones"
}
