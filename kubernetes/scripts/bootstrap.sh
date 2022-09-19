#!/bin/bash

# Run through ssh to install kubernets on both nodes

# Install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# Download public key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Install repo
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install kube{adm,ctl,let}
sudo apt-get update
sudo apt-get install -y --allow-change-held-packages kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

