terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.36.0"
    }
  }
}

provider "google" {
  project = "electric-wave-315708"
  credentials = "./service-account.json"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "nikola-test-bucket-gcp"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}
