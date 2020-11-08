#!/bin/bash

echo "Copying files"
mkdir ~/.creatify
cp -r bin/* ~/.creatify/


echo "export PATH=\$PATH:~/.creatify" >> ~/.bashrc

chmod u+x ~/.creatify/creatify

echo "Please restart the terminal to start using Creatify.."
