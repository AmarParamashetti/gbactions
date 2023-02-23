resource "google_cloud_run_service" "mydockerimage" {
  name     = "cloudrun-srv"
  location = "us-east1"

  template {
    spec {
      containers {
        image = "gcr.io/default-demo-app-e16ba/rqservice:ee8329a3349f7268611999ea873aa82d36d41076"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
