
# extracteur-meteo_LOPEZ_KEBAILI_LOUIZI-DAHMANE_MBONEZANGABO

# Extracteur Météo

##  Objectif du projet
Créer un script Shell permettant d'extraire périodiquement la température actuelle et la prévision du lendemain pour une ville donnée à partir du service [wttr.in](https://wttr.in).
Le scrip enregistre les informations dans un fichier texte , chaque ligne correspondant à une exécution du script. Il inclut également des fonctionnalités supplémentaires comme la sauvegarde au format JSON et la gestion des erreurs avec logs.

##  Équipe
- Lopez Raphaël (version 1)
- Houria Kebaili (version 3)
- Jean Darcy Mbonezangabo (version 2)
- Khaoula Louizi Dahmane (version supplémentaires )

Encadrants :  
- M. Teyssié  
- M. Chebaro
- M. Catteau

## Structure du projet

-Extracteur 

Utilisation de cron :
 Pour automatiser ce script avec CRON, tapez :

     crontab -e

 Puis ajoutez une ligne comme :

 Exemple : exécuter chaque jour à 08h00
 0 8 * * * /chemin/vers/Extracteur_Météo.sh Toulouse

 Exemple : exécuter toutes les heures
 0 * * * * /chemin/vers/Extracteur_Météo.sh

 Le fichier meteo.txt sera mis à jour automatiquement.
