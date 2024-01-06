module "vpc" {
  source = "./module/aws_vpc"

  cidr_block = "10.0.0.0/16"
  name       = "Custom VPC"
}

module "internet_gateway" {
  source = "./module/aws_internet_gateway"

  vpc_id = module.vpc.vpc_id
  name   = "IGW for custom vpc"
}
