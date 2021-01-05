#!/bin/bash

kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

mkdir /vagrant/.kube/
cp /etc/kubernetes/admin.conf /vagrant/.kube/config

kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.16/manifests/calico.yaml

kubeadm token create --print-join-command > /tmp/joincluster.sh