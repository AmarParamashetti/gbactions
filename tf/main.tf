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
}
