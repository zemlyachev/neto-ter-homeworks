output "vm_platform_external_ip_address" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "VM platform external ip"
}

output "vm_platform_db_external_ip_address" {
  value = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
  description = "VM platform db external ip"
}
