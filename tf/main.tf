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
    "foo-service-account" = {
      sa_name   = "projects/default-demo-app-e16ba/serviceAccounts/ghub-250@default-demo-app-e16ba.iam.gserviceaccount.com"
      attribute = "attribute.repository/AmarParamashetti/gbactions"
    }
  }
}

resource "google_storage_bucket" "i18n_backend_bucket" {
  name                        = "CRBucket"
  location                    = us-east1
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  cors {
    origin          = ["*"]
    method          = ["GET"]
    max_age_seconds = 3600
  }
  versioning {
    enabled = false
  }
}
