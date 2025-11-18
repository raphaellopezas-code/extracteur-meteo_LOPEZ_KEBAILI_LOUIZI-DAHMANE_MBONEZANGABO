#!/bin/bash
#On vérifie si un argument est passé au script (on demande un nom de la ville)
if [ -z "$1" ]; then
   echo "Usage : $0 <Ville>"
    exit 1

fi
#Si un nom de ville est donné on l'utilise ,sinon la ville par défaut sera toulouse 
VILLE=${1:-Toulouse}
#On définit un format par défaut : ici c'est texte
FORMAT="txt"
#Si on a un deuxieme argument est que c'est --json , alors on active la sortie JSON
if [ "$2" == "--json" ]; then 
   FORMAT="json"
fi

#On récupere la date et l'heure actuelles
DATE=$(date +"%Y-%m-%d")
HEURE=$(date +"%H:%M")

#Nom du fichier de sortie selon le format (texte ou json)
FICHIER="meteo_${DATE}.${FORMAT}"
#Fichier pour les erreurs 
LOG="meteo_error.log"
#Ici on récupere les infos météo via wttr.in
#Avec un format %t=temeperature ; %C= condition ;%w=vent .%h= humidité, %v=visibilité
INFO=$(curl -s "wttr.in/${VILLE}?format=%t+%C+%w+%h+%v")

#Ici si aucune donnée n'est récupérée , on enregistre l'erreur dans un fichier log
if [ -z "$INFO" ]; then
   echo "[$DATE $HEURE] Erreur: Impossible de récuperer la météo pour $VILLE" >> "$LOG"
   echo "Erreur détectée , Vérifiez $LOG pour plus d'infos"
   exit 1
fi 

#Extraction des diff données météo dans des variables séparées
read -r TEMP PREVISION VENT HUMIDITE VISIBILTE  <<< "$INFO"
#Si le format demandé est du texte 
if [ "$FORMAT" == "txt" ]; then
  LIGNE="${DATE} ${HEURE} ${VILLE} : ${INFO}"
  echo "$LIGNE" >> "$FICHIER"
  echo "Données enregistrées: $LIGNE"

# si le format demandé est JSON alors generation d'un fichier JSON
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
