module "web_access_sg" {
  source = "./module/aws_security_group"

  vpc_id      = module.vpc.vpc_id
  name        = "Web-Access-SG"
  description = "External SG for Web Access"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      cidr_blocks = [var.cidr_blocks]
    },
    {
      from_port   = 80
      to_port     = 80
      cidr_blocks = [var.cidr_blocks]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      cidr_blocks = [var.cidr_blocks]
    }
  ]
}

module "internal_sg" {
  source = "./module/aws_security_group"

  vpc_id      = module.vpc.vpc_id
  name        = "Internal-Access-SG"
  description = "Internal Access SG"

  ingress_rules = [
    {
      from_port       = 22
      to_port         = 22
      security_groups = [module.web_access_sg.sg_id]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      cidr_blocks = [var.cidr_blocks]
    }
  ]
}