provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id = var.cloud
  folder_id = var.folder_id
  zone = var.zone
}

resource "yandex_compute_instance" "gitlab_vm" {
  name = "gitlab"

  resources {
    cores = 2
    memory = 4

    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_image
      size = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.docker-subnet.id
    nat = true
  }

  metadata = {
    user-data = file(var.metadata_file)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo usermod -aG docker $USER"
    ]

    connection {
      host = self.network_interface.0.nat_ip_address
      type = "ssh"
      user = "ubuntu"
      private_key = file(var.private_key_file)
    }
  }

  provisioner "local-exec" {
    command = "echo \"instance ansible_host=${ self.network_interface.0.nat_ip_address } \" > ../ansible/inventory"
  }

  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i ./inventory ./deploy_docker_compose.yml -e external_ip=${ self.network_interface.0.nat_ip_address }"
  }
}
