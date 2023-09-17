data "aws_subnets" "aws_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Tier = var.subnet_tier
  }
}