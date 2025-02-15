terraform{
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~>5.0"
      }
    }
}

provider "google"{
    project = "corded-shift-339409"#actual project id
    region = "us-west1"

}

resource "google_storage_bucket" "my_bucket" {
    name = "my-terraform-bucket-222010"#should be globally unique
    location = "us-west1"
    versioning {
      enabled = true
    }
    labels = {
      environment = "student-lab"
      managed_by = "terraform"
    }
  
}

output "bucket_name"{
    value = google_storage_bucket.my_bucket.name
}