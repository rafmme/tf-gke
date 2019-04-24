// A single Google Cloud Engine instance
resource "google_compute_instance" "bastion_host" {
  name         = "bastion-host"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "echo 'hello world'"

  network_interface {
    network = "default"

    access_config {}

    subnetwork = "${google_compute_subnetwork.rf_public_subnet.name}"
  }

  labels {
    name = "Bastion Host instance"
  }

  depends_on = ["google_compute_subnetwork.rf_public_subnet"]
}
