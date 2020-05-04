# -*- mode: ruby -*-
# vi: set ft=ruby :

CPU             = 2
RAM             = 1024
DOMAIN          = ".example.local"
NODE_NET        = "192.168.42."
NETMASK         = "255.255.255.0"
IMAGE_NAME      = "bento/ubuntu-16.04"
PLAYBOOK        = "./ansible/main.yml"