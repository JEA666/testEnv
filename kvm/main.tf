# instance the provider
terraform {
  backend "local" {
    path = "/home/spk.no/jea/tfstate/terraform.tfstate"
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "tf_ubuntu" {
  name = "tf_ubuntu"
  type = "dir"
  path = "/var/lib/libvirt/images/tf-ubuntu"
}

resource "libvirt_volume" "ubuntu-qcow2" {
  name = "ubuntu-qcow2"
  pool = libvirt_pool.tf_ubuntu.name
#  source = "https://cloud-images.ubuntu.com/releases/xenial/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  source = "/home/spk.no/jea/Downloads/image/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.tf_ubuntu.name
}

resource "libvirt_domain" "domain-ubuntu" {
  name   = "manager0${count.index}+1"
  memory = "512"
  vcpu   = 1
  count = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.ubuntu-qcow2.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

terraform {
  required_version = ">= 0.12"
}
