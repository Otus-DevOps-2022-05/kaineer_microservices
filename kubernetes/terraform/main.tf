provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id = var.cloud
  folder_id = var.folder_id
  zone = var.zone
}

resource "yandex_compute_instance" "k8s_master" {
  name = "master"

  resources {
    cores = 4
    memory = 4

    core_fraction = 100
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
}

resource "yandex_compute_instance" "k8s_slave" {
  name = "slave"

  resources {
    cores = 4
    memory = 4

    core_fraction = 100
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
}
