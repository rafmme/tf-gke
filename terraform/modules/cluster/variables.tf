variable "zone" {}
variable "project" {}
variable "environment" {}
variable "product" {}
variable "owner" {}
variable "maintainer" {}

variable "machine_type" {
  default = "g1-small"
}

variable "private_subnet_ip_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_ip_cidr" {
  default = "10.0.0.0/24"
}

variable "cluster_ip_cidr" {
  default = "10.1.0.0/16"
}

variable "master_ip_cidr" {
  default = "10.1.1.0/28"
}

variable "node_count" {
  default = 3
}

variable "network_name" {
  
}

variable "subnetwork_name" {
  
}

variable "cluster_name" {
  
}



