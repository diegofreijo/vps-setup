#!/bin/bash

print(){
	echo -e "\e[32m[+] $1\e[39m"
}

if [ "$EUID" -ne 0 ]; then
	print "Please run me as root"
	exit
fi

print "VPS setup starting!"

export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
apt install -y golang-go autojump zsh python3-pip snapd nmap masscan unzip nikto dirb

# oh-my-zsh
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
cp .zshrc ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc


# Tools
mkdir -p ~/tools
cd ~/tools

snap install amass
#git clone https://github.com/j3ssie/Osmedeus && cd Osmedeus && ./install.sh
git clone https://github.com/danielmiessler/SecLists.git

go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe
go get -u github.com/tomnomnom/meg
go get -u github.com/tomnomnom/gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf


# Projects
mkdir -p ~/projects
cd ~/projects


# Done
print "Done! Rebooting..."
reboot
