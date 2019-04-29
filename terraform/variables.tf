variable "gcp_project" {
  default = "rafmme-neon-ah-1555609505"
}

variable "region" {
  default = "europe-west2"
}

variable "machine_type" {
  default = "g1-small"
}

variable "vpc_name" {
  default = "rafmme-gke-vpc"
}

variable "cluster_zone" {
  default = "europe-west2-b"
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

variable "disk_size" {
  default = 2
}

variable "disk_name" {
  default = "pg-data-disk"
}

variable "node_count" {
  default = 3
}





