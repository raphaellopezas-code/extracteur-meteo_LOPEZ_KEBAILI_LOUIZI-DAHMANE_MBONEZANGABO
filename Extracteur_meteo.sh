#!/bin/bash

if [ -z "$1" ]; then
   echo "Usage : $0 <Ville>"
    exit 1

fi

VILLE=${1:-Toulouse}

FORMAT="txt"
if [ "$2" == "--json" ]; then 
   FORMAT="json"
fi


DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

FICHIER="meteo_${DATE}.${FORMAT}"
LOG="meteo_error.log"

INFO=$(curl -s "wttr.in/${VILLE}?format=%t+%C+%v+%h+%w")

if [ -z "$INFO" ]; then
   echo "[$DATE $HEURE] Erreur: Impossible de récuperer la météo pour $VILLE" >> "$LOG"
   echo "Erreur détectée , Vérifiez $LOG pour plus d'infos"
   exit 1
fi 

read -r TEMP PREVISION VENT HUMIDITE VISIBILITE <<< "$INFO"


if [ "$FORMAT" == "txt" ]; then
  LIGNE="${DATE} ${HEURE} ${VILLE} : ${INFO}"
  echo "$LIGNE" >> "$FICHIER"
  echo "Données enregistrées: $LIGNE"
else

echo "{

\"date\": \"$DATE\",
\"heure\": \"$HEURE\",
\"ville\": \"$VILLE\",
\"temperature\": \"$TEMP\",
\"prevision\": \"$PREVISION\",
\"vent\": \"$VENT\",
\"humidite\": \"$HUMIDITE\",
\"visibilite\": \"$VISIBILITE\"
}" >> "$FICHIER"
 
  echo "Données enregistrées  (JSON ) dans $FICHIER"
fi 
