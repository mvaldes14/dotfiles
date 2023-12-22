#!/bin/sh
# Install ansible
pip install --user ansible

# run playbook
ansible-playbook ~/git/ansible-playbooks/main.yml -K
