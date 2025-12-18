resource "yandex_compute_disk" "storage" {
  count = 3

  name     = "disk-${count.index}"
  type     = "network-hdd"
  zone     = var.default_zone
  size     = 1
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  hostname    = "storage"
  platform_id = "standard-v3"
  zone        = var.default_zone
  
  
  resources {
    cores         = var.vms_resources["storage"].cores
    memory        = var.vms_resources["storage"].memory
    core_fraction = var.vms_resources["storage"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  metadata = {
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

  dynamic "secondary_disk" {
    for_each = { for idx, disk in yandex_compute_disk.storage : idx => disk }
    content {
      disk_id = secondary_disk.value.id
    }
  }
}