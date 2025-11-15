#!/bin/bash

VILLE=${1:-Toulouse}

DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

METEO_TEXTE=$(curl -s wttr.in/${VILLE}?format=v2)

if [[ -z "$METEO_TEXTE" ]]; then
    METEO_TEXTE=$(curl -s wttr.in/${VILLE})
fi

TEMP_ACTUELLE=$(echo "$METEO_TEXTE" | grep -m1 -E "[0-9]+°C" | grep -oE "[0-9]+°C")

PREVISION=$(echo "$METEO_TEXTE" \
    | awk '/Tomorrow/{flag=1;next}/°C/{if(flag){print; exit}}' \
    | grep -oE "[0-9]+°C")


LIGNE="${DATE} - ${HEURE} - ${VILLE} : ${TEMP_ACTUELLE} - ${PREVISION}"

echo "$LIGNE" >> meteo.txt
echo "Données enregistrées : $LIGNE"



