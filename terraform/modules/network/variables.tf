variable "region" {}
variable "project" {}

variable "environment" {}

variable "private_subnet_ip_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_ip_cidr" {
  default = "10.0.0.0/24"
}
