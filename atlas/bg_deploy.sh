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

SEDTMP="/tmp/sed.tmp"
PRIMARY_DEPLOYMENT="${DPL_PREFIX}-${COLOR}"
fortsett "New primary deployment: ${PRIMARY_DEPLOYMENT}, current deployment ${SECONDARY_DEPLOYMENT}"

echo "-- "
${AC} get dispatcher -e $APPENV
echo "-- "

fortsett "Make sure the new primary deployment has weight 0% above or not in use. If so, we can modify the dispatcher not use this deploy"

# Echo command first
echo "ac modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${SECONDARY_DEPLOYMENT} -w 100 -i $IKT"
# Do it
${AC} modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${SECONDARY_DEPLOYMENT} -w 100 -i $IKT

# Delete the old deploy
fortsett "Delete deploy ${PRIMARY_DEPLOYMENT}, update dpldesc with sed and create new deploy?"

# Echo
echo "ac delete deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT"
# Do it
${AC} delete deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT
echo "s/version.*/version\": \"$VERSION-$APPENV\"/" > $SEDTMP
sed -f $SEDTMP -i ${APPENV}/${PRIMARY_DEPLOYMENT}.json
rm $SEDTMP
# New deploy
# Echo
echo "ac create deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT"
# Do it
${AC} create deploy -e ${APPENV}  ${PRIMARY_DEPLOYMENT}  -i $IKT
echo  "Waiting ~20 sec to see status for new deploy"
sleep 20
${AC} status

# Mod dispatcher to use new
fortsett "Modify dispatcher ${DISPATCHER} in env ${APPENV} to use new deploy?"
# Echo
echo "ac modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${PRIMARY_DEPLOYMENT} -w 100 -E ${SECONDARY_DEPLOYMENT} -w 0 -i $IKT"
# Do it
${AC} modify dispatcher ${DISPATCHER} -e ${APPENV} -E ${PRIMARY_DEPLOYMENT} -w 100 -E ${SECONDARY_DEPLOYMENT} -w 0 -i $IKT

# DONE
