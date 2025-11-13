#!/bin/bash
echo "Scrip météo - version de base"
if [ -z "$1" ];
then
   echo "Usage = $0 <Ville>"
   exit 1
fi

VILLE =$1
