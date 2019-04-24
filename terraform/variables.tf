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

variable "private_subner_ip_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subner_ip_cidr" {
  default = "10.0.0.1/16"
}

variable "cluster_ip_cidr" {
  default = "10.56.0.0/14"
}



