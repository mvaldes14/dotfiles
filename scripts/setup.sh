#!/bin/bash

set -e pipefail

# Gather details
OS_TYPE=$(uname)
USERNAME=$(whoami)

# Install core packages
if $OS_TYPE == "Linux"; then
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y git curl build-essential ansible-core
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y git curl gcc make
    fi
fi




45  sudo apt-get install software-properties-common
   46  sudo add-apt-repository ppa:neovim-ppa/unstable
   47  sudo apt-get update
   48  sudo apt-get install neovim
  107  sudo apt install zsh rustup
