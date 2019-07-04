#!/bin/bash
sudo su
apt update
apt upgrade --yes --assume-yes
apt install -y golang-go autojump zsh python3-pip

# oh-my-zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./.zshrc ~/.zshrc
source ~/.zshrc

## Amass
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
