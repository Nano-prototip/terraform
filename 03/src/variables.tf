###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1gi5dnqaujmlisdtf2e"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1g84fhisc5a2jileqfg"
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

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0wq2EvbitFpCKSPYqbc2deGiLp+JDWjmuiLyOZ7Jsy root@Linux-Workspace"
  description = "ssh-keygen -t ed25519"
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
    storage = {
      cores           = 2
      memory          = 1
      core_fraction   = 20
    }
  }
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
    core_fraction = number
    hostname = string
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      core_fraction = 20
      disk_volume = 10
      hostname    = "main"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      core_fraction = 20
      disk_volume = 10
      hostname    = "replica"
    }
  ]
}
