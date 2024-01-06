variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "name" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
}

variable "private_name_prefix" {
  default = "Private"
}

variable "public_name_prefix" {
  default = "Public"
}