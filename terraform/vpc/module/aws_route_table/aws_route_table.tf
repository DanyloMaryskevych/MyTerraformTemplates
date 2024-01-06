resource "aws_route_table" "aws_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}