#!/bin/bash

# echo "Installing packages"
# sudo apt update
# sudo apt install apt-transport-https software-properties-common
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt install code
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
# sudo apt-add-repository https://cli.github.com/packages
# sudo apt install gh git wget firefox
# 
# echo "Installing python requirements.."
# pip3 install -r bin/requirements.txt

echo Copying files
mkdir ~/.creatify
cp -r bin/* ~/.creatify/


printf "\nexport PATH=\"\$PATH:/home/$USER/.creatify\"\n" >> ~/.bashrc

chmod u+x "/home/$USER/.creatify/creatify"

echo "Please restart the terminal to start using Creatify.."
