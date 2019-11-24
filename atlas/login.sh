#!/bin/bash

# Assumes parameters: login.sh [${ATLAS_USR} ${ATLAS_PSW}]

ATLAS_USR=${1}
ATLAS_PSW=${2}

source env.sh

LOGIN=`${AC} login --refresh`

echo -n "Logging in .. "

echo "${LOGIN}"

if [[ "${LOGIN}" != "Login successful." ]]; then
    echo "Could not refresh, login again"
    LOGIN=`${AC} login ${API} --username ${ATLAS_USR} --password ${ATLAS_PSW}`
    echo "${LOGIN}"
    echo "----------"
fi

if [[ "${LOGIN}" != "Login successful." ]];  then
    echo "Could not authenticate"
    exit 1
fi
