#!/bin/bash

# Ajoute Toulouse comme ville par default si aucun argument n'a été introduite

VILLE_CIBLE=${1:-Toulouse}
FICHIER_TEMP="meteo_brut.txt"
> "$FICHIER_TEMP"

# Récupération des données météo
curl -s "wttr.in/${VILLE_CIBLE}" -o "$FICHIER_TEMP"
sed -i 's/\x1B\[[0-9;]*[JKmsu]//g' "$FICHIER_TEMP"
# Température actuelle
TEMP_ACTUELLE=$(grep -o '[+-]\?[0-9]\+' "$FICHIER_TEMP" | head -1 )

# Température prévue demain
DATE_DEMAIN=$(date -d tomorrow "+%a %d %b")
TEMP_DEMAIN=$(grep -A5 "$DATE_DEMAIN" "$FICHIER_TEMP" | grep -o '[+-]\?[0-9]\+' | head -2 | tail -1 )


# Date et heure
DATE_COURANTE=$(date +"%Y-%m-%d - %H:%M")


# Écriture des données
echo "${DATE_COURANTE} - ${VILLE_CIBLE} : ${TEMP_ACTUELLE}°C - ${TEMP_DEMAIN}°C">>meteo.txt 


