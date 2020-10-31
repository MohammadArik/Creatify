#!/bin/bash

echo "Installing packages"
sudo apt update
sudo apt install apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt install gh git wget firefox
wget https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux64.tar.gz
sudo tar -xvf geckodriver-v0.27.0-linux64.tar.gz
sudo mv geckodriver /usr/local/bin/
cd /usr/local/bin/
sudo chmod +x geckodriver

echo "Installing python requirements.."
pip3 install -r bin/requirements.txt

echo Copying files
mkdir ~/.creatify
cp -r bin/* ~/.creatify/


printf "export PATH=\"\$PATH:/home/$USER/.creatify\"" >> ~/.bashrc

chmod u+x "/home/$USER/.creatify/creatify"

echo "Please restart the terminal to start using Creatify.."
