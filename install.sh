#!/bin/bash

echo "Copying files"
mkdir ~/.creatify
cp -r bin/* ~/.creatify/

read -p "Do you want to install Creatify Path System? (y/n) " ANSWER
case "$ANSWER" in 
[yY] | [yY][eE][sS])
    printf "\nfunction CreatifyPathSystem(){ \n\t. ~/.creatify/creds.sh \n\teval \"path=\\\\\"\\\$\$1\\\\\"\" \n\tcd \"\$path\" \n}\n\nexport pythonx=\"CreatifyPathSystem python\" \nexport flutterx=\"CreatifyPathSystem flutter\" \nexport webx=\"CreatifyPathSystem web\" \nexport nodex=\"CreatifyPathSystem node\" \n" >> ~/.bashrc
    ;;
[nN] | [nN][oO])
    echo "You will have to install creatify again if you want to install Creatify Path System."
    ;;
*)
    echo "Only yes and no are acceptable your response is taken as negative."
    echo "You will have to install creatify again if you want to install Creatify Path System."
    ;;
esac


echo "export PATH=\$PATH:~/.creatify" >> ~/.bashrc

chmod u+x ~/.creatify/creatify

echo "Please restart the terminal to start using Creatify.."
