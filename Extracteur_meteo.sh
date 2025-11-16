#!/bin/bash

if [ -z "$1" ]; then
   echo "Usage : $0 <Ville>"
    exit 1

fi

VILLE=${1:-Toulouse}

DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

FICHIER="meteo_${DATE}.txt"

INFO=$(curl -s "wttr.in/${VILLE}?format=%t+%C+%w+%h+%v")

LIGNE="${DATE} ${HEURE} ${VILLE} : ${INFO}"

echo "$LIGNE" >> "$FICHIER"

echo "Données enregistrées : $LIGNE"
