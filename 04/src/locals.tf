locals {
  ssh_key = file("~/.ssh/id_rsa.pub")
  ubuntu_ssh_key = "ubuntu:${local.ssh_key}"
}
