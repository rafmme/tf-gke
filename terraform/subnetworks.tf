resource "google_compute_subnetwork" "rf_public_subnet" {
  name          =  "rf-public-subnet"
  ip_cidr_range = "${var.public_subner_ip_cidr}"
  network       = "${google_compute_network.task-vpc.name}"
  region        = "${var.region}"
}
resource "google_compute_subnetwork" "rf_private_subnet" {
  name          =  "rf-private-subnet"
  ip_cidr_range = "${var.private_subner_ip_cidr}"
  network      = "${google_compute_network.task-vpc.name}"
  region        = "${var.region}"
  private_ip_google_access = true
}
