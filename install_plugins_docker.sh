#!/bin/bash

# Définir les variables
CONTAINER_NAME="wordpress"
SCRIPT_PATH="./plugins_list.sh"
CONTAINER_PATH="/tmp/plugins_list.sh"

# Vérifier si le fichier script existe
if [ ! -f "$SCRIPT_PATH" ]; then
  echo "Erreur: Le fichier $SCRIPT_PATH n'existe pas."
  exit 1
fi

# Copier le script dans le conteneur
echo "Copie du fichier $SCRIPT_PATH dans le conteneur $CONTAINER_NAME..."
docker cp "$SCRIPT_PATH" "$CONTAINER_NAME:$CONTAINER_PATH"

# Exécuter le script dans le conteneur
echo "Exécution du script dans le conteneur $CONTAINER_NAME..."
docker exec -it "$CONTAINER_NAME" bash -c "bash $CONTAINER_PATH"

# Optionnel: supprimer le script après l'exécution pour garder le conteneur propre
echo "Suppression du script dans le conteneur..."
docker exec -it "$CONTAINER_NAME" rm "$CONTAINER_PATH"

echo "Installation des plugins terminée !"
