terraform {
  required_version = ">= 1.9.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "sample_bucket" {
  source        = "../../modules/storage_bucket"
  bucket_name   = "${var.name_prefix}-dev-sample"
  location      = var.bucket_location
  force_destroy = false
  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
