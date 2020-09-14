#!/bin/bash

yum update
yum upgrade -y
sudo amazon-linux-extras install ansible2 -y
yum install git -y

ansible-pull -U https://github.com/coresolutions-ltd/jenkins-terraform-pipeline -C 2.0.0 Ansible/playbook.yml --extra-vars "colour=${colour}"
