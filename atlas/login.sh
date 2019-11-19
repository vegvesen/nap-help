#!/bin/bash

# Assumes parameters: redeploy.sh ${ATLAS_USR} ${ATLAS_PSW}
ATLAS_USR=${1}
ATLAS_PSW=${2}

echo "Logging in"
LOGIN=`/c/Programfiler/Atlas/bin/ac.exe login --refresh`
#LOGIN=`~/bin/ac login --refresh`
echo "${LOGIN}"

if [[ "${LOGIN}" != "Login to Atlas successful." ]]; then
    echo "Could not refresh, login again"
    LOGIN=`/c/Programfiler/Atlas/bin/ac.exe login https://atlas-api.atlas.vegvesen.no/api --username ${ATLAS_USR} --password ${ATLAS_PSW}`
    echo "${LOGIN}"
    echo "----------"
fi

if [[ "${LOGIN}" != "Login successful." ]];  then
    echo "Could not authenticate"
    exit 1
fi
