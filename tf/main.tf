resource "google_cloud_run_service" "cloudruntf" {
  provider = google-beta
  name     = "cloudrun-img"
  location = "us-east1"
  template {
    spec {
      containers {
        image = "gcr.io/default-demo-app-e16ba/rqservice:fb7c0d8428a95429b8894b99c3c9e94233271296"
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_policy" "run_all_users" {
  location = google_cloud_run_service.cloudruntf.location
  project = google_cloud_run_service.cloudruntf.project
  service  = google_cloud_run_service.cloudruntf.name
  
  policy_data = data.google_iam_policy.noauth.policy_data
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

output "name" {
  value = google_cloud_run_service_iam_policy.run_all_users.service
}
output "prj" {
  prjc = google_cloud_run_service_iam_policy.run_all_users.project
}
output "lc" {
  lcn = google_cloud_run_service_iam_policy.run_all_users.location
}
