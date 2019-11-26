#!/bin/bash

# Usage: hugo.sh <appenv>
#
# Ex: ./hugo.sh utvikling

source env.sh

APPENV=$1

if [[ ! ($APPENV == "utvikling" || $APPENV == "produksjon") ]]
then
        echo "Usage: $0 <utvikling|produksjon>"
        exit
fi

cd $HUGO_ROOT
${HUGO} --gc --cleanDestinationDir -e $APPENV
