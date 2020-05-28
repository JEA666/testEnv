# Vars for KVM
dependencies=(
  ["apt"]="
  unzip
  make
  qemu-kvm
  libvirt-bin
  bridge-utils
  virt-manager
  libvirt-dev
  "
  ["wget"]="
  https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
  https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
  "
  ["git"]="
  https://github.com/dmacvicar/terraform-provider-libvirt.git
  "
  )

groups=(
  "kvm"
  "libvirt"
  )

# Vars for Terraform install
# tfVersion=(
#   "0.12.25"
#   ) 

# Vars for Terraform libvirt plugin
srcPath=(
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
installPath=(
  "${HOME}/git/testEnv/kvm"
  )

appPath=(
  "/usr/local"
  )

GOPATH=(
  "${HOME}/go"
  )

goVars=(
  "PATH=$PATH:/usr/local/go/bin"
  "GOPATH=${HOME}/go"
  "GOBIN=${HOME}/go/bin"
  )

# Vars 
directories=(
   "${HOME}/Downloads"
   "${GOPATH}/src/github.com/dmacvicar"
   "${GOBIN}"
   "${HOME}/.terraform.d/plugins"
   )