# Note this is done on ubuntu but this can be ised on any linux machine: check containerd official page

#!/bin/bash

# Download Containerd binaries
wget https://github.com/containerd/containerd/releases/download/v2.3.3/containerd-2.3.3-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local containerd-2.3.3-linux-amd64.tar.gz


# Setup Systemd Service
wget   https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
sudo mkdir -p /usr/local/lib/systemd/system/
sudo cp containerd.service /usr/local/lib/systemd/system/containerd.service


# Setup runc

wget https://github.com/opencontainers/runc/releases/download/v1.5.1/runc.amd64

sudo install -m 755 runc.amd64 /usr/local/sbin/runc

# Setup CNI Plugins

wget https://github.com/containernetworking/plugins/releases/download/v1.9.1/cni-plugins-linux-amd64-v1.9.1.tgz

sudo mkdir -p /opt/cni/bin

sudo tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.9.1.tgz

# Start Containerd
sudo systemctl daemon-reload
sudo systemctl enable --now containerd