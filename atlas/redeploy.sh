#!/bin/bash

# Assumes parameters: redeploy.sh <version> <appenv> <olor>

source env.sh

VERSION=$1
APPENV=$2
COLOR=$3

if [ "${VERSION}"  ]
then
    echo ""
else
    echo "Usage: $0 <artefact version> <appenv> <color>"
    exit
fi

if [[ ! ($APPENV == "utvikling" || $APPENV == "produksjon") ]]
then
        echo "Usage: $0 <version> <utvikling|produksjon> <color>"
        exit
fi

if [[ ! ($COLOR == "blue" || $COLOR == "green") ]]
then
        echo "Usage: $0 <version> <utvikling|produksjon> <blue|green>"
        exit
fi

echo "Generate new version of site, named $VERSION, for Atlas appenv $APPENV"
./hugo.sh $APPENV

fortsett "Continue with building artefact with the new version?"
./artrepo.sh $VERSION $APPENV

fortsett "Creating new Atlas app.image from new artefact with version $VERSION?"
./build.sh $VERSION $APPENV

fortsett "OK"
