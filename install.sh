#!/bin/bash

echo "Copying files"
mkdir ~/.creatify
cp -r bin/* ~/.creatify/


printf "export PATH=\"\$PATH:/home/$USER/.creatify\"" >> ~/.bashrc

chmod u+x "/home/$USER/.creatify/creatify"

echo "Please restart the terminal to start using Creatify.."
