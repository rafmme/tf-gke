resource "google_compute_disk" "pg-data-disk" {
  name  = "${var.disk_name}"
  type  = "pd-ssd"
  zone  = "${var.cluster_zone}"
  size = "${var.disk_size}"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
