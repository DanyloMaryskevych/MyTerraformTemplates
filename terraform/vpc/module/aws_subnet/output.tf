output "subnet_name" {
  value = aws_subnet.subnet.tags.Name
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}
