# -*- mode: ruby -*-
# vi: set ft=ruby :

#MANAGER       = "k8s-manager"
CPU           = 2
RAM           = 1024
DOMAIN        = ".example.com"
#MANAGER_IP    = "192.168.42.10"
NODE_NET      = "192.168.42."
NETMASK       = "255.255.255.0"
IMAGE_NAME    = "bento/ubuntu-18.04"
PLAYBOOK      = "./ansible/testEnv.yml"
NODES         = 1
MACHINE_ID    = 0