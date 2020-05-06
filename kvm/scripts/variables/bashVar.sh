# Vars for KVM
dependencies=(
  "qemu-kvm"
  "libvirt-daemon-system"
  "libvirt-clients"
  "bridge-utils"
  "virt-manager"
  )

groups=(
  "kvm"
  "libvirt"
  )

# Vars for Terraform libvirt plugin
gitPath=(
  "/src/github.com/dmacvicar"
  )

pluginDir=(
  "/terraform-provider-libvirt"
  )

gitUrl=(
  "https://github.com/dmacvicar/terraform-provider-libvirt.git"
  )

terraformPath=(
  "/.terraform.d/plugins"
  )

# Vars for Golang innstall
appPath=("/usr/local/go/bin")

GOPATH=("${HOME}/go")

goVars=(
  "PATH=$PATH:/usr/local/go/bin"
  "GOPATH=${HOME}/go"
  "GOBIN=${HOME}/go/bin"
  )