#!/bin/bash

# Switch between blue and green deploy
# "color" parameter is the deployment to switch TO

# Assumes parameters: bg_deploy.sh <app.env> <color>

source env.sh

# Check existence of Atlas config

if [ ! -f "atlas.json" ]; then
    echo "No root Atlas config found - try another directory?"
    exit
fi

ENV=$1
COLOR=$2

if [ ! -d "$ENV" ]; then
    echo "Atlas app.env $ENV does not exist?"
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
fortsett "Primary ${PRIMARY_DEPLOYMENT}, secondary ${SECONDARY_DEPLOYMENT}"
