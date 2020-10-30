#!/bin/bash

echo "Installing packages"

sudo apt install apt-transport-https software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh git wget firefox
pip3 install -r bin/requirements.txt

echo Copying files
mkdir ~/.creatify
cp bin/* ~/.creatify/

echo export PATH=$PATH:~/.creatify >> ~/.bashrc
chmod +x ~/.creatify/creatify

echo "Please restart the terminal to start using Creatify.."
