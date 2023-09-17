variable "vpc_id" {
  type = string
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "ingress_rules" {
  default = []
}

variable "egress_rules" {
  default = []
}

variable "ingress_protocol" {
  type = string
  default = "tcp"
}

variable "egress_protocol" {
  default = -1
}
