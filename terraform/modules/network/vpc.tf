resource "google_compute_network" "tembea-vpc-network" {
  name = "tembea-${var.environment}-vpc"
  auto_create_subnetworks = "false"
  project = "${var.project}"
}
