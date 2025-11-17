#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 <ville>"
    exit 1
fi
VILLE=$1
FICHIER_TEMP="meteo_brut.txt"
> "$FICHIER_TEMP"

curl -s "wttr.in/${VILLE}" -o "$FICHIER_TEMP"

sed -i 's/\x1B\[[0-9;]*[JKmsu]//g' "$FICHIER_TEMP"

TEMP_ACTUELLE=$(grep -o '[+-]\?[0-9]\+' "$FICHIER_TEMP" | head -1 | sed 's/^+//')


DATE_DEMAIN=$(date -d tomorrow "+%a %d %b")
TEMP_PREVUE=$(grep -A5 "$DATE_DEMAIN" "$FICHIER_TEMP" | grep -o '[+-]\?[0-9]\+' | head -2 | tail -1 | sed 's/^+//')
DATE_COURANTE=$(date +"%Y-%m-%d - %H:%M")

[ ! -f "meteo.txt" ] && touch "meteo.txt"


echo "${DATE_COURANTE} - ${VILLE} : ${TEMP_ACTUELLE}°C - ${TEMP_PREVUE}°C" >> "meteo.txt"

