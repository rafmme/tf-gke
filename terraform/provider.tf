// Configure the Google Cloud provider
provider "google" {
 credentials = "../credentials/rafmme-sa.json"
 project     = "${var.gcp_project}"
 region      = "${var.region}"
}
