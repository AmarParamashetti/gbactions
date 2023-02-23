resource "google_service_account" "sa" {
  project    = "default-demo-app-e16ba"
  account_id = "ghub-250@default-demo-app-e16ba.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "project" {
  project = "default-demo-app-e16ba"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.sa.email}"
}

module "gh_oidc" {
  source      = "github.com/terraform-google-modules/terraform-google-github-actions-runners.git//modules/gh-oidc?ref=v3.1.0"
  project_id  = "default-demo-app-e16ba"
  pool_id     = "my-pools"
  provider_id = "my-providers"
  attribute_mapping = {
    "google.subject"             = "assertion.sub"
    "attribute.actor"            = "assertion.actor"
    "attribute.aud"              = "assertion.aud"
    "attribute.repository_owner" = "assertion.repository_owner"
    "attribute.sub"              = "assertion.sub"
  }
  sa_mapping = {
    "google_service_account.sa.account_id" = {
      sa_name   = "projects/default-demo-app-e16ba/serviceAccounts/ghub-250@default-demo-app-e16ba.iam.gserviceaccount.com"
      attribute = "attribute.repository/AmarParamashetti/gbactions"
    }
  }
}

resource "google_storage_bucket" "rq_backend_bucket" {
  name                        = "rqtfkCRBucket"
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
