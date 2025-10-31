#!/bin/bash

VILLE=${1:-Toulouse}        # Ajoute Toulouse comme ville par default si aucun argument n'a été introduite

DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

# 1. Récupération des données météo avec wttr.in
# (format texte simple)
METEO_BRUTE=$(curl -s "https://wttr.in/${VILLE}?format=3")

# On veut récupérer la température actuelle
TEMP_ACTUELLE=$(echo "$METEO_BRUTE" | grep -oE '[+-]?[0-9]+°C')

# 2. Température prévue pour demain
# On récupère une ligne spécifique de wttr.in
PREVISION=$(curl -s "https://wttr.in/${VILLE}?format=%t+%T" | tail -n 1)

# 3. Enregistrer les données dans meteo.txt
LIGNE="${DATE} - ${HEURE} - ${VILLE} : ${TEMP_ACTUELLE} - ${PREVISION}" 
echo "$LIGNE" >> meteo.txt

# Message à l'écran
echo "Données enregistrées : $LIGNE"

