#!/bin/bash

# Create k8s cluster

EXTERNAL_IP=51.250.78.80

sudo kubeadm init \
  --apiserver-cert-extra-sans=${EXTERNAL_IP} \
  --apiserver-advertise-address=0.0.0.0 \
  --control-plane-endpoint=${EXTERNAL_IP} \
  --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
