resource "google_container_cluster" "task-cluster" {
  name              = "task-cluster"
  location          = "${var.cluster_zone}"
  cluster_ipv4_cidr = "${var.cluster_ip_cidr}"
  network           = "${google_compute_network.task-vpc.name}"
  subnetwork        = "${google_compute_subnetwork.rf_private_subnet.name}"

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
    }, {
      cidr_block = "${var.private_subnet_ip_cidr}"
    }]
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "${var.master_ip_cidr}"
  }

  depends_on = ["google_compute_network.task-vpc"]
}

resource "google_container_node_pool" "task_cluster_nodes" {
  name       = "task-cluster-nodes"
  location   = "${var.cluster_zone}"
  cluster    = "${google_container_cluster.task-cluster.name}"
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
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
