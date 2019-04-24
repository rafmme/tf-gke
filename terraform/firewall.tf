resource "google_compute_firewall" "task_firewall" {
  name    = "task-firewall"
  network = "${google_compute_subnetwork.rf_public_subnet.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = [ "22"]
  }

  source_ranges = ["0.0.0.0/0"]

  source_tags = ["web"]
}
