variable "vm_env" {
  type        = string
  default     = "develop"
  description = "VM environment"
}

variable "vm_project" {
  type        = string
  default     = "platform"
  description = "VM project type"
}

variable "vm_role_web" {
  type        = string
  default     = "web"
  description = "VM role web"
}

variable "vm_role_db" {
  type        = string
  default     = "db"
  description = "VM role db"
}

# vm_web
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Yandex image family"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform"
}

# vm_db
variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Yandex image family"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform"
}

variable "vms_resources" {
  type        = map(map(number))
  description = "VMs resources"
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
