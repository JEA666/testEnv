# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_domain" "k8s_masters" {
  name = "k8s_masters"
  vcpu = 1
  memory = 1024
}

resource "libvirt_domain" "k8s_workers" {
  name = "k8s_workers"
  vcpu = 2
  memory = 1024
}