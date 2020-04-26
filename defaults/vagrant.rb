# -*- mode: ruby -*-
# vi: set ft=ruby :

CPU             = 2
RAM             = 1024
DOMAIN          = ".example.com"
NODE_NET        = "192.168.42."
NETMASK         = "255.255.255.0"
IMAGE_NAME      = "bento/ubuntu-18.04"
PLAYBOOK        = "./ansible/main.yml"