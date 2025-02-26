#!/bin/bash

# Définir les variables
CONTAINER_NAME="wordpress"
PLUGIN_SCRIPT_PATH="./plugins_list.sh"
THEME_SCRIPT_PATH="./themes_list.sh"
SETTING_SCRIPT_PATH="./settings_list.sh"
PLUGIN_CONTAINER_PATH="/tmp/plugins_list.sh"
THEME_CONTAINER_PATH="/tmp/themes_list.sh"
SETTING_CONTAINER_PATH="/tmp/settings_list.sh"

# Vérifier si les fichiers de script existent
if [ ! -f "$PLUGIN_SCRIPT_PATH" ]; then
  echo "Erreur: Le fichier $PLUGIN_SCRIPT_PATH n'existe pas."
  exit 1
fi

if [ ! -f "$THEME_SCRIPT_PATH" ]; then
  echo "Erreur: Le fichier $THEME_SCRIPT_PATH n'existe pas."
  exit 1
fi

if [ ! -f "$SETTING_SCRIPT_PATH" ]; then
  echo "Erreur: Le fichier $SETTING_SCRIPT_PATH n'existe pas."
  exit 1
fi

# Copier les scripts dans le conteneur
echo "Copie du fichier $PLUGIN_SCRIPT_PATH dans le conteneur $CONTAINER_NAME..."
docker cp "$PLUGIN_SCRIPT_PATH" "$CONTAINER_NAME:$PLUGIN_CONTAINER_PATH"

echo "Copie du fichier $THEME_SCRIPT_PATH dans le conteneur $CONTAINER_NAME..."
docker cp "$THEME_SCRIPT_PATH" "$CONTAINER_NAME:$THEME_CONTAINER_PATH"

echo "Copie du fichier $SETTING_SCRIPT_PATH dans le conteneur $CONTAINER_NAME..."
docker cp "$SETTING_SCRIPT_PATH" "$CONTAINER_NAME:$SETTING_CONTAINER_PATH"

# Exécuter les scripts dans le conteneur
echo "Exécution du script des plugins dans le conteneur $CONTAINER_NAME..."
docker exec -it "$CONTAINER_NAME" bash -c "bash $PLUGIN_CONTAINER_PATH"

echo "Exécution du script des thèmes dans le conteneur $CONTAINER_NAME..."
docker exec -it "$CONTAINER_NAME" bash -c "bash $THEME_CONTAINER_PATH"

echo "Exécution du script settings dans le conteneur $CONTAINER_NAME..."
docker exec -it "$CONTAINER_NAME" bash -c "bash $SETTING_CONTAINER_PATH"

# Optionnel: supprimer les scripts après l'exécution pour garder le conteneur propre
echo "Suppression des scripts dans le conteneur..."
docker exec -it "$CONTAINER_NAME" rm "$PLUGIN_CONTAINER_PATH"
docker exec -it "$CONTAINER_NAME" rm "$THEME_CONTAINER_PATH"
docker exec -it "$CONTAINER_NAME" rm "$SETTING_CONTAINER_PATH"

echo "C'est terminée ! 🥳"
