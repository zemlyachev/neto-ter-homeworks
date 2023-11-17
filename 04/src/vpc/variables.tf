variable "vpc_name" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet_cidr_block" {
  type = list(string)
}
