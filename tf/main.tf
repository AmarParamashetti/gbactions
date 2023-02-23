
resource "google_storage_bucket" "rq_backend_bucket" {
  name                        = "rqttfkbuck"
  location                    = "us-east1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  cors {
    origin          = ["*"]
    method          = ["*"]
    max_age_seconds = 3600
  }
  versioning {
    enabled = false
  }
}
