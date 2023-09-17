variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "cidr_blocks" {
  type = string
  default = "0.0.0.0/0"
}

variable "ipv6_cidr_blocks" {
  type = list(string)
  default = ["::/0"]
}