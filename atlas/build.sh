#!/bin/bash

# Assumes parameters: build.sh <version> <appenv>

source env.sh

VERSION=$1
APPENV=$2

if [ "${VERSION}"  ]
then
    echo ""
else
    echo "Usage: $0 <artefact version> <appenv>"
    exit
fi

if [[ ! ($APPENV == "utvikling" || $APPENV == "produksjon") ]]
then
        echo "Usage: $0 <version> <utvikling|produksjon>"
        exit
fi

APPENV_VERSION="${VERSION}-${APPENV}"
# Kan hende versjon inneholder tegn shellet plukker opp
QUOTED_VERSION="'$APPENV_VERSION'"
QUOTED_GROUP_ID="'$GROUP_ID'"

DESCR="'Ny versjon ${VERSION} av ${IKT} hjelpesider'"

fortsett "Creating new Atlas build of type $BUILD_TYPE, artefact version will be $APPENV_VERSION"

echo "${AC} create build ${BUILD_TYPE} -g ${QUOTED_GROUP_ID} -a ${ARTIFACT_ID} -v ${QUOTED_VERSION} -d ${DESCR} -p ${PACKET_TYPE}"
