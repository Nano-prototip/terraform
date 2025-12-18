variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_web_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_instance_platform_id" {
  type        = string
  default     = "standard-v3"
}

# variable "vm_web_instance_cores" {
#   type        = number
#   default     = 2
# }

# variable "vm_web_instance_memory" {
#   type        = number
#   default     = 1
# }

# variable "vm_web_instance_core_fraction" {
#   type        = number
#   default     = 20
# }

variable "vm_web_instance_nat_ip_address" {
  type        = string
  default     = "178.154.227.203"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_db_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
}

variable "vm_db_instance_platform_id" {
  type        = string
  default     = "standard-v3"
}

# variable "vm_db_instance_cores" {
#   type        = number
#   default     = 2
# }

# variable "vm_db_instance_memory" {
#   type        = number
#   default     = 2
# }

# variable "vm_db_instance_core_fraction" {
#   type        = number
#   default     = 20
# }

variable "vm_db_instance_nat_ip_address" {
  type        = string
  default     = "89.169.173.167"
}

variable "vms_resources" {
  type = map(object({
    cores          = number
    memory         = number
    core_fraction  = number
  }))
  
  default = {
    web = {
      cores           = 2
      memory          = 1
      core_fraction   = 20
    }
    db = {
      cores           = 2
      memory          = 2
      core_fraction   = 20
    }
  }
}