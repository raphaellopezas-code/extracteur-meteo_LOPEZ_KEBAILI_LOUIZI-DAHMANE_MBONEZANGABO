#!/bin/bash
*
#On crée une boucle au cas ou l'utilisateur ne rentre pas de ville
if [ $# -eq 0 ]; then
    echo "Usage: $0 <ville>"
    exit 1
fi

#onn initie ville = la ville donnée par l'utilisateur
VILLE=$1

#ici on récupère les données météo globaux
METEO=$(curl -s "wttr.in/${VILLE}" | sed 's/\x1B\[[0-9;]*[JKmsu]//g')

#ici on récupérer les données météo de aujourd'hui exactement
TEMP_ACTUELLE=$(echo "$METEO" | grep -o '[+-]\?[0-9]\+°C' | head -1)

#ici on récupérer les données météo de demain exactement
DATE_DEMAIN=$(date -d tomorrow "+%a %d %b")
TEMP_DEMAIN=$(echo "$METEO" | grep -A8 "$DATE_DEMAIN" | grep -o '[+-]\?[0-9]\+°C' | head -1)

# Affichage de tout
DATE_COURANTE=$(date +"%Y-%m-%d - %H:%M")
echo "${DATE_COURANTE} - ${VILLE} : ${TEMP_ACTUELLE} - ${TEMP_DEMAIN}"

