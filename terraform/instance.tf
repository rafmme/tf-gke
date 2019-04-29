// A single Google Cloud Engine instance
resource "google_compute_instance" "bastion_host" {
  name         = "bastion-host"
  machine_type = "${var.machine_type}"
  zone         = "${var.cluster_zone}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20181023"
    }
  }

  metadata_startup_script = "curl -s -L https://github.com/rafmme/tf-gke/blob/master/bash_script/main.sh | bash"

  network_interface {
    network = "${google_compute_network.task-vpc.name}"
    access_config {}
    subnetwork = "${google_compute_subnetwork.rf_public_subnet.name}"
  }

  labels {
    name = "bastion-host-instance"
  }

  depends_on = ["google_compute_subnetwork.rf_public_subnet"]
}
