#!/usr/bin/env bash

source ../env.sh
export PS1="\e[0;34m\h$ "
cat bgdemo.txt
read
clear
cd ..

echo -e "\e[1;32mFørst - hvilket deploy er koplet til vår LB (Atlas dispatcher) for løsningen (\"napt\")?\e[0m"
echo -e "\n\t\e[1;33m\$ac get dispatcher -e utvikling -i napt\e[0m\n"
read
clear
ac get dispatcher -e utvikling

echo -e "\n\e[1;32mKun Blue - da oppretter vi først Green (deploymentbeskrivelse må alt være laget):\e[0m"

echo -e "\n\t\e[1;33m\$ac create deploy transport-green -e utvikling\n\e[0m"
read
clear
ac create deploy transport-green -e utvikling
echo -e "\n\e[1;32mTar litt tid før deployet er aktivt og poder helsesjekket, kan sjekkes med Atlas klienten:\e[0m]"
echo -e "\n\t\e[1;33m\$ac status\e[0m\n"
read
clear
ac status | egrep 'utvikling|DEPLOY' | grep -v stm
echo -en "\n\e[1;32mIkke klart. Vi venter litt og prøver igjen ...\e[0m"
sleep 13
echo -e "\n\n\t\e[1;33m\$ac status\e[0m\n"
clear
ac status | egrep 'utvikling|DEPLOY' | grep -v stm
echo -en "\n\e[1;32mNytt deploy klart. Kan nå kople om dispatcheren:\e[0m"
echo -e "\n\n\t\e[1;33m\$ac modify dispatcher napt-lb -E transport-green -w 100 -E transport-blue -w 0 -e utvikling\e[0m\n"
read
clear
ac modify dispatcher napt-lb -E transport-green -w 100 -E transport-blue -w 0 -e utvikling
echo -en "\n\e[1;32mNå er sluttbrukerne koplet til grønt deploy! Sjekk:\e[0m\n"
echo -e "\n\t\e[1;33m\$ac get dispatcher -e utvikling -i napt\e[0m\n"
ac get dispatcher -e utvikling
