#!/bin/bash

PROJECT=$1
STAGE=$2
SERVICE=$3
TESTSTRATEGY=$4

if [[ -z "$TESTSTRATEGY" ]]; then
  TESTSTRATEGY="performance"
fi

if [[ -z "$PROJECT" || -z "$STAGE" || -z "$SERVICE" ]]; then
  echo "Please specify project, stage and service. Optionally specify your test strategy if its other than performance:"
  echo "Usage: ./starttests.sh perfservice performance simplenodeservice [performance]"
  exit 1
fi

# Generate a temp file with replaced placeholders
inputfile="deployment.finished.event.placeholders.json"
tmpfile="deployment.finished.event.tmp.json"

if [ -f $tmpfile ] ; then
    rm -f $tmpfile
fi

sed -e "s/\$PROJECT/$PROJECT/" -e "s/\$STAGE/$STAGE/" -e "s/\$SERVICE/$SERVICE/" -e "s/\$TESTSTRATEGY/$TESTSTRATEGY/" -e "s/\$USER/$USER/" $inputfile >> $tmpfile

# now lets execute the keptn command
# keptn send event --file=$tmpfile
keptn send event --file $tmpfile