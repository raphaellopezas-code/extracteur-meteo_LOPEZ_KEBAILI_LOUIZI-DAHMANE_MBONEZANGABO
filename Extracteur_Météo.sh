#!/bin/bash

# Vérification qu'une ville a été passée en argument
if [ -z "$1" ]; then
  echo "Utilisation : ./Extracteur_Météo.sh <ville>"
  exit 1
fi

VILLE=$1
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

# 3. Afficher les données
echo "${DATE} - ${HEURE} - ${VILLE} : ${TEMP_ACTUELLE} - ${PREVISION}" 

