#!/bin/bash
# version 3 Gestion d’historique
#Toulouse par défaut (aucun arguement fourni)
VILLE=${1:-Toulouse}
#je crée un nom de fichier qui dépend de la date du jour 
Jour=$(date +"%Y%m%d")
fichier_historique="meteo_${Jour}.txt"
#je récupert la méteo 
tmp_aujourdhui=$(curl -s "wttr.in/$VILLE?format=%t")
tmp_demain=$(curl -s "wttr.in/$VILLE?format=%t&tomorrow")
#ajout la ligne dans le fichier histrorique 
echo"$(date"+%y-%d-%d:%m")$meteo >> "$fichier"

