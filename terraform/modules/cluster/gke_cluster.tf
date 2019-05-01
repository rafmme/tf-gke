resource "google_container_cluster" "tembea-cluster" {
  name              = "tembea-${var.environment}"
  project           = "${var.project}"
  zone         = "${var.zone}"
  cluster_ipv4_cidr = "${var.cluster_ip_cidr}"
  network           = "${var.network_name}"
  subnetwork        = "${var.subnetwork_name}"

  resource_labels = {
    product    = "${var.product}"
    component  = "frontend_backend"
    env        = "${var.environment}"
    owner      = "${var.owner}"
    maintainer = "${var.maintainer}"
    state      = "in_use"
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""
  }

  ip_allocation_policy {
    use_ip_aliases = true
  }

  master_authorized_networks_config {
    cidr_blocks = [{
      cidr_block = "${var.public_subnet_ip_cidr}"
    },
      {
        cidr_block = "${var.private_subnet_ip_cidr}"
      },
    ]
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "${var.master_ip_cidr}"
  }
}

resource "google_container_node_pool" "tembea-cluster-nodes" {
  name       = "tembea-cluster-nodes-${var.environment}"
  project    = "${var.project}"
  location   = "${var.zone}"
  cluster    = "${var.cluster_name}"
  node_count = "${var.node_count}"

  autoscaling {
    min_node_count = 3
    max_node_count = 5
  }

  management {
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/trace.append"
    ]
  }
}
