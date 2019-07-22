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
apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes
apt install -y golang-go autojump zsh python-pip python3-pip snapd nmap masscan unzip sslscan nikto

# oh-my-zsh
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
cp .zshrc ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc

# Amass
snap install amass

# Tools
mkdir -p ~/tools
cd ~/tools

git clone https://github.com/j3ssie/Osmedeus && cd Osmedeus && ./install.sh
git clone https://github.com/danielmiessler/SecLists.git


# Projects
mkdir -p ~/projects
cd ~/projects


# Done
print "Done! Rebooting..."
reboot
