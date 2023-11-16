data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

resource "yandex_compute_instance" "web" {
  count       = var.vm_count
  name        = format("web-%d", count.index + 1)
  platform_id = var.vm_platform_id
  resources {
    cores  = var.count_vm_res.cores
    memory = var.count_vm_res.memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    security_group_ids = [yandex_vpc_security_group.example.id]
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ubuntu_ssh_key
  }
}
