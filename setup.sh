#!/bin/bash
#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"
#ROOT PRIVILEGIES
if [[ $EUID -ne 0 ]]; then
        echo -e "$yellow[!]$white execute program as root $yellow[!]$nc"
        exit 1
fi
echo -e "$green update $yellow[✔]$nc"
sudo apt-get update
#Xterm
if hash xterm 2>/dev/null; then
	echo -e "$green xterm $yellow[✔]$nc"
else
	echo -e "$green xterm $yellow[✘]$nc"
sudo apt-get install xterm
fi
#Whiptail
if hash whiptail 2>/dev/null; then
	echo -e "$green whiptail $yellow[✔]$nc"
else
	echo -e "$green whiptail $yellow[✘]$nc"
sudo apt-get install whiptail
fi
#Apache2
if hash apache2 2>/dev/null; then
	echo -e "$green Apache2 $yellow[✔]$nc"
else
	echo -e "$green Apache2 $yellow[✘]$nc"
sudo apt-get install apache2
fi
#Metasploit
if hash msfconsole 2>/dev/null; then
        echo -e "$green Metasploit-Framework $yellow[✔]$nc"
else
        echo -e "$green Metasploit-Framework $yellow[✘]$nc"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > metasploit_installer && chmod 755 metasploit_installer && ./metasploit_installer
fi
#grep
if hash grep 2>/dev/null; then
        echo -e "$green grep $yellow[✔]$nc"
else
        echo -e "$grenn grep $yellow[✘]$nc"
sudo apt-get install grep
fi
#grep
if hash curl 2>/dev/null; then
        echo -e "$green curl $yellow[✔]$nc"
else
        echo -e "$grenn curl $yellow[✘]$nc"
sudo apt-get install curl
fi
chmod +x winspy.sh
