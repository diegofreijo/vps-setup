#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes
apt install -y golang-go autojump zsh python3-pip

# oh-my-zsh
apt install zsh
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
cp .zshrc ~/.zshrc
source ~/.zshrc

# Amass
go get github.com/OWASP/Amass
cd $GOPATH/src/github.com/OWASP/Amass
go install ./...

# Tools
mkdir -p ~/tools
cd ~/tools

git clone https://github.com/danielmiessler/SecLists.git


# Projects
mkdir -p ~/projects
cd ~/projects
