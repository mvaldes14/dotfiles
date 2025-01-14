#!/bin/bash

# Runs a single command in multiple nodes
#
# Usage:
# jws-cmd '<filter>' '<command>'
#
# Example:
# jws-cmd 'vmstorage test' echo 'hello'

filter=$1
shift
command=$@

for node in $(jws-grep $filter | awk '{ print $2 }'); do
    echo $node
    ssh -q -t $node "sudo $command"
done
