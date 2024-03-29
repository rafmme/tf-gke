#!/usr/bin/env bash

set -e pipefail

function install_kubectl () {
    sudo apt-get update
    sudo apt-get install -y apt-transport-https

    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo touch /etc/apt/sources.list.d/kubernetes.list 
    
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
}


function main () {
    install_kubectl
}


main
