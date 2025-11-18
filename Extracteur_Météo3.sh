#!/bin/bash
# version 3 Gestion d’historique
#Toulouse par défaut (aucun arguement fourni)
VILLE=${1:-Toulouse}
#Date et heure actuelles
DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")
#je crée un nom de fichier qui dépend de la date du jour 
Jour=$(date +"%Y%m%d")
fichier_historique="meteo_${Jour}.txt"
#je récupert la méteo 
tmp_aujourdhui=$(curl -s "wttr.in/$VILLE?format=%t")
tmp_demain=$(curl -s "wttr.in/$VILLE?format=%t&tomorrow")
#j'ajoute la ligne dans le fichier histrorique 
echo "$DATE - $HEURE - $VILLE : $tmp_aujourdhui - $tmp_demain" >> "$fichier_historique"
#j'affiche un message de confirmation
echo "Données enregistrées dans $fichier_historique:"
tail -n 1 "$fichier_historique"

