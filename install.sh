#!/bin/bash

echo "Copying files"
mkdir ~/.creatify
cp -r bin/* ~/.creatify/

echo ". ~/.creatify/CreatifyPathSystem.sh" >> ~/.bashrc

echo "export PATH=\$PATH:~/.creatify" >> ~/.bashrc

chmod u+x ~/.creatify/creatify

echo "Enjoy Using Creatify.."

source ~/.bashrc
