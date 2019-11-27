#!/bin/bash

# Switch between blue and green deploy
# "color" parameter is the deployment to switch TO

# Assumes parameters: bg_deploy.sh <version> <app.env> <color>
source env.sh

# Check existence of Atlas config

if [ ! -f "atlas.json" ]; then
    echo "No root Atlas config found - try another directory?"
    exit
fi

VERSION=$1
APPENV=$2
COLOR=$3


if [ ! -d "$APPENV" ]; then
    echo "Atlas app.env $APPENV does not exist?"
    exit
fi

if [ "${COLOR}" = "blue"  ]
then
   SECONDARY_DEPLOYMENT="${DPL_PREFIX}-green"
elif [ "${COLOR}" = "green"  ]
then
   SECONDARY_DEPLOYMENT="${DPL_PREFIX}-blue"
else
     echo "Illegal color: $COLOR - must be green or blue"
     exit;
fi

PRIMARY_DEPLOYMENT="${DPL_PREFIX}-${COLOR}"
fortsett "New primary deployment: ${PRIMARY_DEPLOYMENT}, current deployment ${SECONDARY_DEPLOYMENT}"

echo "-- "
${AC} get dispatcher -e $APPENV
echo "-- "

fortsett "Make sure the new primary deployment has weight 0% above or not in use"

echo "${AC} modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${SECONDARY_DEPLOYMENT} -w 100 -i $IKT"

fortsett "Delete deploy ${PRIMARY_DEPLOYMENT}, update dpldesc and create new deploy?"

echo "${AC} delete deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT"
echo " sed -i 's/version.*/version\": \"${VERSION}-${APPENV}\"/' ${APPENV}/${PRIMARY_DEPLOYMENT}.json"
echo "${AC} create deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT"

fortsett "Modify dispatcher ${DISPATCHER} in env ${APPENV} to use new deploy?"
echo "${AC} modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${PRIMARY_DEPLOYMENT} -w 100 -E ${SECONDARY_DEPLOYMENT} -w 0 -i $IKT"
