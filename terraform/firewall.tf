resource "google_compute_firewall" "task_firewall" {
  name    = "task-firewall"
  network = "${google_compute_network.task-vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = [ "22"]
  }

  source_ranges = ["0.0.0.0/0"]

  source_tags = ["web"]

  depends_on = ["google_compute_network.task-vpc"]
}

resource "google_compute_firewall" "task_firewall_ii" {
  name    = "task-firewall-ii"
  network = "${google_compute_network.task-vpc.name}"
  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = [ "1-62349"]
  }

  depends_on = ["google_compute_network.task-vpc"]
}
