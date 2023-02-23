resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_cloud_run_service" "mydockerimage" {
  name     = "cloudrun-srv"
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
   depends_on = [google_project_service.run_api]
}

resource "google_cloud_run_service_iam_policy" "run_all_users" {
  location = google_cloud_run_service.mydockerimage.location
  project = google_cloud_run_service.mydockerimage.project
  service  = google_cloud_run_service.mydockerimage.name
  
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
