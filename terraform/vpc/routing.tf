module "aws_route" {
  source = "./module/aws_route"

  route_table_id = module.vpc.route_table_id

  gateway_id             = module.internet_gateway.igw_id
  destination_cidr_block = var.cidr_blocks
}

module "private_subnets_route_table" {
  source = "./module/aws_route_table"

  vpc_id = module.vpc.vpc_id
  name   = "Private-RT"
}

module "aws_private_subnet_ids" {
  source = "./module/data_sources/aws_subnet_ids"

  vpc_id      = module.vpc.vpc_id
  subnet_tier = "Private"
}

module "aws_private_subnets_route_table_association" {
  source = "./module/aws_route_table_subnet_association"

  route_table_id = module.private_subnets_route_table.aws_route_table_id

  for_each  = toset(module.aws_private_subnet_ids.subnet_ids)
  subnet_id = each.value
}
