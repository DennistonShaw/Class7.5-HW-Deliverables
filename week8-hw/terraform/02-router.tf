# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "main_router" {
  name    = "main-router"
  region  = "us-central1"
  network = google_compute_network.main_vpc.id
}