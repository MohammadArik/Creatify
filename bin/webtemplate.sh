#!/bin/bash

title=$1
targetDir="$2"

cd "$targetDir/$title"

touch "index.html"
printf "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n\t<meta charset=\"UTF-8\">\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" >> "./index.html"
printf "\t<link rel=\"stylesheet\" href=\"./stylesheets/style.css\">\n\t<title>$title</title>\n</head>\n<body>\n\t<h1>Made with Love by <a href=\"https://github.com/MohammadArik/creatify\">Creatify</a></h1>\n\t<h2>Creatify is a open source project by <a class=\"arik\" href=\"https://arik.netlify.app/\">Mohammad Arik</a></h2>\n" >> "./index.html"
printf "\n\n\t<script src=\"./scripts/index.js\"></script>\n</body>\n</html>" >> "./index.html"
mkdir stylesheets
cd "./stylesheets"
touch "style.css"
printf "body{\n\tbackground: #70e1f5;\n\tbackground: -webkit-linear-gradient(to right, #ffd194, #70e1f5);\n\tbackground: linear-gradient(to right, #ffd194, #70e1f5);\n}\n" >> "./style.css"
printf "h1{\n\tmargin-top: 15%s ;\n\tfont-size: 62px;\n\ttext-align: center;\n\tbackground: -webkit-linear-gradient(#4568dc, #b06ab3);\n\t-webkit-background-clip: text;\n\t-webkit-text-fill-color: transparent;\n}\n" "%" >> "./style.css"
printf "a{\n\ttext-decoration: none;\n\tfont-size: 72px;\n\tbackground: -webkit-linear-gradient(#c0392b, #8e44ad);\n\t-webkit-background-clip: text;\n\t-webkit-text-fill-color: transparent;\n}" >> "./style.css"
printf "h2{\n\tfont-size: 29px;\n\ttext-align: center;\n\tbackground: -webkit-linear-gradient(#bdc3c7, #2c3e50);\n\t-webkit-background-clip: text;\n\t-webkit-text-fill-color: transparent;\n}\n" >> "./style.css"
printf ".arik{\n\ttext-decoration: none;\n\tfont-size: 35px;\n\tbackground: -webkit-linear-gradient(#eb3349, #f45c43);\n\t-webkit-background-clip: text;\n\t-webkit-text-fill-color: transparent;\n}" >> "./style.css"
cd ..
mkdir "scripts"
cd "./scripts"
touch "index.js"
cd ..


