# resource "google_compute_instance" "sample-vm" {
#   name         = "public-iowa-lizzo-loves-me"
#   machine_type = "e2-medium"
#   zone         = "us-central1-a"

#   # Create a new disk from an image and set as boot disk
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-12"
#     }
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.hqinternal.name
#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")

# }

###############################
resource "google_compute_instance" "main_vm" {
  name         = "main-vm"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-10"
      size  = 100
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata_startup_script = file("./startup-for-rhel.sh")
}