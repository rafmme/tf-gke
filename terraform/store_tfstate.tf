resource "google_storage_bucket" "tf_state_store" {
  name     = "tf-state-prod"
  location = "EU"
}

/* terraform {
  backend "gcs" {
    bucket  = "tf-state-prod"
    prefix  = "terraform/state"
  }

  force_destroy = true
  depends_on = ["google_storage_bucket.tf_state_store"]
}

resource "google_storage_bucket_acl" "tf_state_store_acl" {
  bucket = "${google_storage_bucket.tf_state_store.name}"
  predefined_acl = "publicreadwrite"

  depends_on = ["google_storage_bucket.tf_state_store"]
}

 */

