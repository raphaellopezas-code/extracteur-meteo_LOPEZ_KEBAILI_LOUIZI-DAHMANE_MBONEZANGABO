#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <ville>"
    exit 1
fi

VILLE=$1

METEO=$(curl -s "wttr.in/${VILLE}" | sed 's/\x1B\[[0-9;]*[JKmsu]//g')

TEMP_ACTUELLE=$(echo "$METEO" | grep -o '[+-]\?[0-9]\+°C' | head -1)

DATE_DEMAIN=$(date -d tomorrow "+%a %d %b")
TEMP_DEMAIN=$(echo "$METEO" | grep -A8 "$DATE_DEMAIN" | grep -o '[+-]\?[0-9]\+°C' | head -1)
DATE_COURANTE=$(date +"%Y-%m-%d - %H:%M")

echo "${DATE_COURANTE} - ${VILLE} : ${TEMP_ACTUELLE} - ${TEMP_DEMAIN}"

