terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.14.0"
    }
  }
}

provider "google" {
  project     = "fluted-mercury-412715"
  region      = "us-central1"
  credentials = "./keys/my-creds.json"
}


resource "google_storage_bucket" "demo-bucket" {
  name          = "fluted-mercury-412715-terra-bucket"
  location      = "US"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}