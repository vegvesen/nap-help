#!/usr/bin/env bash

source ../env.sh
export PS1="\e[0;34m\h$ "
clear
cd ..

# Antar deploy er opprettet, hvis ikke, utfør denne:
# ac create deploy transport -e utvikling

echo -e "\n\n\t\e[1;33m\$ac status\e[0m\n"
read
clear
ac status | egrep 'utvikling|DEPLOY' | grep -v stm
echo -en "\n\e[1;32mDeploy aktivt. Kan nå rulle ut ny versjon\e[0m"
echo -e "\n\n\t\e[1;33m\$ac perform rolling deploy transport -e utvikling -v v1.0.12-utvikling\e[0m\n"
read
clear
ac perform rolling deploy transport -e utvikling -v v1.0.12-utvikling
echo -en "\n\e[1;32mNy versjon etter hvert klar\e[0m\n"
echo -e "\n\t\e[1;33m\$ac status\e[0m\n"
read
clear
ac status
