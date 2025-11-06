#!/bin/bash

VILLE=${1:-Toulouse}        # Ajoute Toulouse comme ville par default si aucun argument n'a été introduite

DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

# 1. Récupération des données météo avec wttr.in
# (format JSON)
METEO_BRUTE=$(curl -s wttr.in/${VILLE}?format=j2)

# On veut récupérer la température actuelle
TEMP_ACTUELLE=$(echo "$METEO_BRUTE" | grep '"avgtempC":' | head -n 1 | awk -F'"' '{print $4 "°C"}')

# 2. Température prévue pour demain
# On récupère une ligne spécifique de wttr.in
PREVISION=$(echo "$METEO_BRUTE" | grep -A 20 '"date":' | grep -A 20 "${DATE}" | grep '"avgtempC"' | awk -F'"' '{print $4 "°C"}')

# 3. Enregistrer les données dans meteo.txt
LIGNE="${DATE} - ${HEURE} - ${VILLE} : ${TEMP_ACTUELLE} - ${PREVISION}" 
echo "$LIGNE" >> meteo.txt

# Message à l'écran
echo "Données enregistrées : $LIGNE"

