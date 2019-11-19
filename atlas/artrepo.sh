#!/bin/bash

FILE=$1
GROUP="vt/transportportal"
ARTIFACT="napt"
KEY="AKCp5e3AEu5jPPCun6D9cMGJt2q7nfvwQgtMjkHgpJuKEzRF47hQcTKMyHwu5npKiqW73BZh8"

echo "Uploading $FILE to artrepo ..."
curl -H X-JFrog-Art-Api:${KEY} -T ${FILE} https://artrepo.vegvesen.no/artifactory/webcontent-release-local/${GROUP}/${ARTIFACT}/
