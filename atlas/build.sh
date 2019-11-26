#!/bin/bash

# Assumes parameters: build.sh <version> (req)

source env.sh

VERSION=$1


if [ "${VERSION}"  ]
then
    echo ""
else
    echo "Usage: $0 <artefact version>"
    exit
fi

# Kan hende versjon inneholder tegn shellet plukker opp
QUOTED_VERSION="'$1'"

DESCR="'Ny versjon ${VERSION} av ${IKT} hjelpesider'"

fortsett "Creating new Atlas build of type $BUILD_TYPE, artefact version $VERSION"

echo ${AC} create build ${BUILD_TYPE} -g ${GROUP_ID} -a ${ARTIFACT_ID} -v ${QUOTED_VERSION} -d ${DESCR} -p ${PACKET_TYPE}
