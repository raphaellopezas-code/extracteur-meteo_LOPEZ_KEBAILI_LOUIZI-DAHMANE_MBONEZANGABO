
# extracteur-meteo_LOPEZ_KEBAILI_LOUIZI-DAHMANE_MBONEZANGABO

# Extracteur Météo

##  Objectif du projet
Créer un script Shell permettant d'extraire périodiquement la température actuelle et la prévision du lendemain pour une ville donnée à partir du service [wttr.in](https://wttr.in).

##  Équipe
- Lopez Raphaël
- Houria Kebaili
- Jean Darcy Mbonezangabo
- Khaoula Louizi Dahmane

Encadrants :  
- M. Teyssié  
- M. Chebaro
- M. Catteau

## Structure du projet

Utilisation de cron :
 Pour automatiser ce script avec CRON, tapez :

     crontab -e

 Puis ajoutez une ligne comme :

 Exemple : exécuter chaque jour à 08h00
 0 8 * * * /chemin/vers/Extracteur_Météo.sh Toulouse

 Exemple : exécuter toutes les heures
 0 * * * * /chemin/vers/Extracteur_Météo.sh

 Le fichier meteo.txt sera mis à jour automatiquement.
