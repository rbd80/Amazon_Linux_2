#!/bin/bash
set -e
#config.sh

if [ "$(uname)" == "Debian" ]; then
  sudo apt-get update -y && sudo apt-get upgrade -y
  sudo apt-get install -y python-dev python-pip
  sudo pip install ansible
elif [ "$(expr substr $(uname -s) 1 5)" == "Amazon" ]; then
  sudo easy_install pip
  sudo pip install boto3
  sudo pip install ansible
fi
