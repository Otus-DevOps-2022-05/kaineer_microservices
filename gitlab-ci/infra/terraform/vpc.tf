resource "yandex_vpc_network" "docker-network" {
  name = "docker-gitlab-network"
}

resource "yandex_vpc_subnet" "docker-subnet" {
  name = "docker-gitlab-subnet"
  zone = var.zone

  network_id = yandex_vpc_network.docker-network.id

  v4_cidr_blocks = ["192.168.10.0/24"]
}
