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

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "VM cores count"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "VM memory"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "VM core fraction %"
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

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "VM cores count"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "VM memory"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "VM core fraction %"
}
