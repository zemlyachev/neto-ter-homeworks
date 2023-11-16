###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Yandex image family"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform"
}

variable "vm_count" {
  default     = 2
  type        = number
  description = "Count of VM"
}

variable "count_vm_res" {
  description = "VM parameter"
  type        = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "brand" {
  type    = string
  default = "netology"
}

variable "each_vm" {
  description = "Each VMs"
  type        = list(object({
    vm_name = string
    cpu     = number
    ram     = number
    disk    = number
  }))
  default = [
    { vm_name = "main", cpu = 2, ram = 2, disk = 10 },
    { vm_name = "replica", cpu = 4, ram = 4, disk = 20 }
  ]
}
