resource "yandex_compute_disk" "disk" {
  count = var.storage_vm_disk.count
  name  = format("%s-%d", var.storage_vm_disk.name_prefix, count.index + 1)
  type  = var.storage_vm_disk.type
  size  = var.storage_vm_disk.size
}

resource "yandex_compute_instance" "storage" {
  depends_on = [yandex_compute_disk.disk]
  name       = var.storage_vm_res.vm_name

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
    }
  }

  resources {
    cores  = var.storage_vm_res.cpu
    memory = var.storage_vm_res.ram
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.storage_vm_res.disk
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
