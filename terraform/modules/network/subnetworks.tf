resource "google_compute_subnetwork" "tembea-public-subnet" {
  name          =  "tembea-${var.environment}-public-subnet"
  project = "${var.project}"
  ip_cidr_range = "${var.public_subnet_ip_cidr}"
  network       = "${google_compute_network.tembea-vpc-network.name}"
  region        = "${var.region}"
}
resource "google_compute_subnetwork" "tembea-private-subnet" {
  name          =  "tembea-${var.environment}-private-subnet"
  project = "${var.project}"
  ip_cidr_range = "${var.private_subnet_ip_cidr}"
  network      = "${google_compute_network.tembea-vpc-network.name}"
  region        = "${var.region}"
  private_ip_google_access = true
}
