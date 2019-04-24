// Create VPC
resource "google_compute_network" "task-vpc" {
  name                    = "${var.vpc_name}"
  auto_create_subnetworks = "false"
}
