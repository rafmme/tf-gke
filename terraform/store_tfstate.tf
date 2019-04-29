terraform {
  backend "gcs" {
    bucket      = "task-tf-state"
    prefix      = "terraform/state"
    credentials = "../credentials/rafmme-sa.json"
  }
}
