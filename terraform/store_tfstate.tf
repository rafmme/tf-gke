terraform {
  backend "gcs" {
    bucket      = "task-tf-state"
    prefix      = "terraform/state"
    credentials = "../credentials/rafmme-sa.json"
  }
}

/* resource "google_storage_bucket_acl" "tf_state_store_acl" {
  bucket = "${google_storage_bucket.tf_state_store.name}"
  predefined_acl = "publicreadwrite"

  depends_on = ["google_storage_bucket.tf_state_store"]
}

resource "google_storage_bucket" "tf_state_store" {
  name     = "task-tf-state"
  location = "EU"
}
*/

