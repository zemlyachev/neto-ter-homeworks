#resource "yandex_vpc_network" "develop" {
#  name = var.vpc_name
#}
#
#resource "yandex_vpc_subnet" "develop" {
#  name           = var.vpc_name
#  zone           = var.default_zone
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.default_cidr
#}

module "vpc_dev" {
  source            = "./vpc"
  vpc_name          = var.vpc_name
  zone              = var.default_zone
  subnet_cidr_block = var.default_cidr
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vpc_name
  network_id     = module.vpc_dev.vpc_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = var.vm_web_name
  instance_count = 1
  image_family   = var.vm_mew_image
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars     = {
    ssh_key = local.ssh_key
  }
}
