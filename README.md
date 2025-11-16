
# extracteur-meteo_LOPEZ_KEBAILI_LOUIZI-DAHMANE_MBONEZANGABO

# Extracteur Météo

##  Objectif du projet
Créer un script Shell permettant d'extraire périodiquement la température actuelle et la prévision du lendemain pour une ville donnée à partir du service [wttr.in](https://wttr.in).
Le script enregistre les informations dans un fichier texte , chaque ligne correspondant à une exécution du script. Il inclut également des fonctionnalités supplémentaires comme la sauvegarde au format JSON et la gestion des erreurs avec logs.

##  Équipe
- Lopez Raphaël (version 1)
- Houria Kebaili (version 3)
- Jean Darcy Mbonezangabo (version 2)
- Khaoula Louizi Dahmane (verison supplémentaires)

Encadrants :  
- M. Teyssié  
- M. Chebaro
- M. Catteau

## Structure du projet

-'Extracteur- `Extracteur_Meteo.sh` : script principal  
- `meteo_YYYY-MM-DD.txt` : historique quotidien (texte)  
- `meteo_YYYY-MM-DD.json` : option JSON si utilisée  
- `meteo_error.log` : logs des erreurs avec timestamp 

## Gestion des versions avec Git 

Le projet utilise Git pour suivre l'évolution du script et des fichiers associés.
Chaque version majeure et variante est commitée régulièrement, avec éventuellement des branches spécifiques pour travailler sur de nouvelles fonctionnalités avant de les fusionner dans la branche principale.

Tags utilisés pour marquer les versions majeures et pour les variantes : 

-version 1: version de base
-version 2: automatisation avec cron 
-version 3: Gestion de l'historique et logs
-VAR1: récupération du vent , humidité et visibilité 
-VAR2: suavegarde JSON
-VAR3: gestion des erreurs logs 

Les commits permettent de suivre l'évolution et les contributuions de chaque membre de l'équipe 


## Versions du projet 

## Version 1: Script de base

-Récupération de la météo pour une ville donnée avec 'curl'
-Extraction de la température actuelle et de la prévision du lendemain
-formatage des informations dans 'meteo.txt' sur une suele ligne

## Version 2: Automatisation périodique 

-Ville par défaut si aucun argument fourni (Toulouse)
-Possibilité d'automatiser le script avec CRON
-Les informations s'ajoutent automatiquement dans le fichier texte 

## version 3: Gestion de l'historique 

-Chaque jour un nouveau fichier 'meteo_YYYYMMDD.txt' est créé
-Les nouvelles données s'ajoutent au fichier du jour 
-Utilisation du format texte uniquement pour rester compatible avec 'wttr.in'

## Variantes supplémentaires

-Variante1: récupération d'informations supplémentaires: vent , humidité, visibilité
-Variante2: sayvegarde ptionelle au format JSON
-Variante3: gestion des erreurs avec logs horodatés ('meteo_error.log')

## Automatisation avec CRON 

Pour exécuter automatiquement le script à l'intervalles réguliers, tu peux utiliser CRON:

Pour automatiser ce script avec CRON, tapez :

     crontab -e

 Puis ajoutez une ligne comme :

 Exemple : exécuter chaque jour à 08h00
 0 8 * * * /chemin/vers/Extracteur_Météo.sh Toulouse

 Exemple : exécuter toutes les heures
 0 * * * * /chemin/vers/Extracteur_Météo.sh

 Le fichier meteo.txt sera mis à jour automatiquement.

