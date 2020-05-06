#!/bin/bash

PROJECT="perfservice"
STAGE="performance"
SERVICE="simplenodeservice"
TESTSTRATEGY=$1
URL=$2

./starttests.sh $PROJECT $STAGE $SERVICE $TESTSTRATEGY $URL