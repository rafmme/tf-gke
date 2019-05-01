resource "google_compute_instance" "bastion_host" {
  name         = "tembea-${var.environment}-bastion-host"
  machine_type = "${var.machine_type}"
  project      = "${var.project}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20181023"
    }
  }

  network_interface {
    network       = "${var.network_name}"
    access_config = {}
    subnetwork    = "${var.subnetwork_name}"
    
  }

  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y apt-transport-https; curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -; sudo touch /etc/apt/sources.list.d/kubernetes.list; echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee -a /etc/apt/sources.list.d/kubernetes.list; sudo apt-get update; sudo apt-get install -y kubectl"

  labels {
    name = "tembea-${var.environment}-bastion-host-instance"
  }
}
