resource "local_file" "hosts_cfg" {
  filename = "./hosts.cfg"
  content = templatefile("./ansible.tftpl", {
    webservers = yandex_compute_instance.web
    databases  = yandex_compute_instance.db
    storagevm  = [yandex_compute_instance.storage]
  })
}