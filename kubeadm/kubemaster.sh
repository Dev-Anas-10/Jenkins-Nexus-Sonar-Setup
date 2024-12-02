#!/bin/bash

# Initializing Kubernetes Master Node
sudo kubeadm init

# Configure kubectl for the user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply Calico CNI (Container Network Interface)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

# Extract token and discovery-token-ca-cert-hash for joining worker nodes
TOKEN=$(sudo kubeadm token create)
HASH=$(sudo openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | \
    sudo openssl rsa -pubin -outform der | \
    sudo sha256sum | \
    awk '{print $1}')

# Save the token and hash to a file (e.g., to send to worker nodes later)
echo "kubeadm join $(hostname -I | awk '{print $1}'):6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$HASH" > join_command.txt
echo "The join command has been saved to join_command.txt"

