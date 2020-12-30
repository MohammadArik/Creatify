#!/bin/bash

function CreatifyPathSystem(){ 
	. ~/.creatify/creds.sh 
	eval "path=\"\$$1\"" 
	cd "$path" 
}

alias pythonx="CreatifyPathSystem python" 
alias flutterx="CreatifyPathSystem flutter" 
alias webx="CreatifyPathSystem web" 
alias nodex="CreatifyPathSystem node" 

