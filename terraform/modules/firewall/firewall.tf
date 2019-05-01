resource "google_compute_firewall" "tembea-firewall" {
  name    = "tembea-${var.environment}-firewall"
  network = "${var.network_name}"
  project = "${var.project}"

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

resource "google_compute_firewall" "tembea-firewall-ii" {
  name    = "tembea-${var.environment}-firewall-ii"
  network = "${var.network_name}"
  project = "${var.project}"
  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = [ "1-62349"]
  }
}
