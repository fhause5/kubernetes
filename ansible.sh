#!/bin/bash
yum update -y
yum install -y epel-release
yum install -y git nano ansible unzip wget
cd /vagrant/src/ansible/
ansible-playbook -i inv.txt playbook.yaml
