#!/bin/bash

set -e pipefail

# Gather details
OS_TYPE=$(uname)
USERNAME=$(whoami)
ANSIBLE_REPO="https://github.com/mvaldes14/ansible_playbooks"

# Install core packages
if $OS_TYPE == "Linux"; then
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y git curl build-essential ansible-core
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y git curl gcc make
    fi
fi

echo "Installed minimal packages for ansible playbook"

git clone $ANSIBLE_REPO

echo "Cloned ansible playbook repository"
