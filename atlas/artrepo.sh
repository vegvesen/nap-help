#!/bin/bash

# Usage: artrepo.sh <version> <appenv>
#
# Ex: ./artrepo.sh v.0.9.3 utvikling

source env.sh

VERSION=$1
APPENV=$2

if [[ ! ($APPENV == "utvikling" || $APPENV == "produksjon") ]]
then
        echo "Usage: $0 <version> <utvikling|produksjon>"
        exit
fi
FILE="/tmp/${ARTIFACT_ID}-${VERSION}-${APPENV}.tar.gz"

if [  -f "$FILE" ]; then
    fortsett "Artefact $FILE already exists"

fi

cd ${HUGO_ROOT}/${HUGO_DOCS}/
tar --gzip -cf $FILE .

cd ${HUGO_ROOT}/${ATLAS_CONFIG}

# Artrepo group uses slashes as sep, Atlas/Maven uses "dot"
GROUP=`echo $GROUP_ID | sed 's/\./\//'`

# Artrepo keyfile (NB! not part of our GIT repo) needs to be generated by Artifactory for personal use
KEY=`cat $ARTREPO_KEYFILE`

fortsett "Uploading artefact $FILE to Artifactory repo ${ARTREPO_REPO}, group $GROUP, artefact $ARTIFACT_ID ..."

echo "curl -H X-JFrog-Art-Api:${KEY} -T ${FILE} https://artrepo.vegvesen.no/artifactory/${ARTREPO_REPO}/${GROUP}/${ARTIFACT_ID}/"

curl -H X-JFrog-Art-Api:${KEY} -T ${FILE} https://artrepo.vegvesen.no/artifactory/${ARTREPO_REPO}/${GROUP}/${ARTIFACT_ID}/

fortsett "Artefact uploaded, delete file $FILE?"
rm $FILE
