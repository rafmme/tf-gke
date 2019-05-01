variable "project" {}
variable "owner" {}
variable "maintainer" {}

locals {
  region = "${terraform.workspace == "staging" ? "europe-west2" : "europe-west1"}"
  zone   = "${terraform.workspace == "staging" ? "europe-west2-a": "europe-west1-b"}"
}

terraform {
  backend "gcs" {
    bucket = "tembea-tf-state"
    prefix = "terraform/state"
  }
}

module "main" {
  source  = "./modules/cloud_provider"
  project = "${var.project}"
  zone    = "${local.zone}"
  region  = "${local.region}"
}

module "network" {
  source      = "./modules/network"
  environment = "${terraform.workspace}"
  region      = "${local.region}"
  project  = "${var.project}"
}

module "cluster" {
  source      = "./modules/cluster"
  environment = "${terraform.workspace}"
  project = "${var.project}"
  zone        = "${local.zone}"
  product     = "tembea"
  owner       = "${var.owner}"
  maintainer  = "${var.maintainer}"
  network_name = "${module.network.tembea-vpc-network-name}"
  subnetwork_name = "${module.network.tembea-private-subnet-name}"
  cluster_name = "${module.cluster.tembea-cluster-name}"
}

module "compute_instance" {
  source      = "./modules/compute_instance"
  environment = "${terraform.workspace}"
  project = "${var.project}"
  zone        = "${local.zone}"
  network_name = "${module.network.tembea-vpc-network-name}"
  subnetwork_name = "${module.network.tembea-public-subnet-name}"
}

module "firewall" {
  source      = "./modules/firewall"
  environment = "${terraform.workspace}"
  network_name = "${module.network.tembea-vpc-network-name}"
  project = "${var.project}"
}
