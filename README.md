
# extracteur-meteo_LOPEZ_KEBAILI_LOUIZI-DAHMANE_MBONEZANGABO
# Extracteur Météo

#  Extracteur Météo


##  Objectif du projet
Créer un script Shell permettant d'extraire périodiquement la température actuelle et la prévision du lendemain pour une ville donnée à partir du service [wttr.in](https://wttr.in).
Le scrip enregistre les informations dans un fichier texte , chaque ligne correspondant à une exécution du script. Il inclut également des fonctionnalités supplémentaires comme la sauvegarde au format JSON et la gestion des erreurs avec logs.


##  Équipe
- Lopez Raphaël (version 1)
- Houria Kebaili (version 3)
- Jean Darcy Mbonezangabo (version 2)
- Khaoula Louizi Dahmane (version supplémentaires )
## Équipe
- Lopez Raphaël
- Houria Kebaili
- Jean Darcy Mbonezangabo
- Khaoula Louizi Dahmane


Encadrants :  
- M. Teyssié  
- M. Chebaro
- M. Catteau


## Structure du projet
##  Structure du projet


-Extracteur Extracteur_Meteo.sh : script principal 
 -meteo_YYYY-MM-DD.txt : historique quotidien (texte)
 - meteo_YYY-MM-DD.json : option JSON si utilisée
 - meteo_error.log: logs des erreurs avec timestamp

## Gestion des versions avec Git

Le projet utilise Git pour suivre l'évolution du script et des fichiers associés. Chaque version majeure et variante est commitée régulièrement, avec éventuellement des branches spécifiques pour trvailler sur de nouvelles fonctionnalités avant de les fusionner dans la branche principale.

## Tags Utilisés pour marquer les versions majeures et pour les variantes:

-versions 1: Mise à jour du code de base pour qu'il soit conforme
-version 1: Version de la final de la v1
-version 1: Version 1 terminer avec les commentaires 
-version 2: Automatisation périodique 
-version 2: Configuration du CRON
-version 3 : création du fichier historique 
-version 3 : mise à jour quotidienne de l'historique météo
-Variantes sup : variantes modifier et terminer 
-Variantes sup : Variantes finaliser avec des commentaires 

Les commits permettant de suivre l'évolution et les contributions de chaque membre de l'équipe

## Versions du projet

## Version 1: Script de base

  -Récupération de la météo pour une ville donnée avec 'curl' 
  -Extraction de la température actuelle et de la prévision du lendemain -formatage des informations dans 'meteo.txt' sur une suele ligne
  
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


## Utilisation de cron :

1° Automatisation avec cron

Pour automatiser l'exécution du script `Extracteur_Météo.sh`, il faut créer une tâche cron.

### Sous windows

Il faut d'abord télécharger l'environnement WSL, pour cela:

1. Vous allez sur le terminal de votre ordinateur, tapez
	 wsl --install
  Windows va installer un environnement Linux sur votre ordinateur et un terminal UBUNTU s'ouvre
2. Entrer votre nom d'utilisateur et votre mot de passe
3. Après ça, il te dira:
	Installation successful!

Après l'installation de WSL, il faut maintenant installer cron
Pour cela il faut tapez ces 3 commandes:

sudo apt update			# Mets à jour le package ubuntu
sudo apt install cron		# Installation de cron
sudo service cron start		# Démarre le service cron en arrière-plan
 
Pour automatiser le script avec CRON, vous ouvrez alors le planificateur cron dans UBUNTU en tapant :

     crontab -e

on va te demander quel type d'éditeur tu veux utiliser, choisis 1 pour nano.

Rajoutez la ligne de commande à la fin, comme par exemple celle-ci:

* * * * * cd /chemin/vers/le répertoire/contenant/le script && /bin/bash Extracteur_Météo.sh Toulouse >> meteo.txt     # Il va se rendre d'abord dans le répertoire contenant le script puis exécuter le script toutes les minutes et envoie la sortie dans meteo.txt 

Le fichier meteo.txt sera mis à jour automatiquement.

### Sous macOS

1. Ouvrir le terminal
2. Positionnez vous dans le repertoire contenant le script en utilisant :
	cd chemin/repertoire
3. Donnez l'autorisation au script en utilisant :
	chmod +X Extracteur_Météo.sh
4. Ouvrez le planificateur cron : crontab -e
5. Rajoutez la ligne de commande à la fin :

* * * * * cd /chemin/vers/le répertoire/contenant/le script && ./Extracteur_Météo.sh Toulouse >> meteo.txt
