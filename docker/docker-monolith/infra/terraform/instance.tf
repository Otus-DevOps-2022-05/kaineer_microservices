resource "yandex_compute_instance" "reddit" {
  name = "reddit"

  resources {
    cores = 2
    memory = 1

    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_image
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.app-subnet.id
    nat = true
  }

  metadata = {
    user-data = file(var.metadata_file)
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y python3 python3-pip python3-docker",
      "pip3 install docker"
    ]

    connection {
      host = self.network_interface.0.nat_ip_address
      type = "ssh"
      user = "ubuntu"
      private_key = file(var.private_key_file)
    }
  }

  # Create ansible/inventory file
  provisioner "local-exec" {
    command = "[ ! -f ../ansible/inventory ] && touch ../ansible/inventory; echo \"instance ansible_host=${ self.network_interface.0.nat_ip_address } \" >> ../ansible/inventory"
  }

  # Run playbook
  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook ../ansible/run_image.yml"
  }
}
