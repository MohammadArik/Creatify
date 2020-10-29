#!/bin/bash

echo "We will install some required linux and python programs and packages first."

sudo apt-add-repository https://cli.github.com/packages
sudo apt install apt-transport-https
sudo apt update
sudo apt install gh git wget
pip3 install -r ./requirements.txt

cp ./bin/{configure.sh,Creatify-GithubCLI.sh,Creatify-WebScraping.sh,creatify,webtemplate.sh,create.py} "/home/mohammadarik/.creatify/"
# cp -r

echo "export PATH=\"\$PATH:/home/mohammadarik/.creatify\"" >> "/home/mohammadarik/.bashrc"
chmod u+x "/home/mohammadarik/.creatify/creatify"\

echo "Please restart the terminal to start using Creatify.."
