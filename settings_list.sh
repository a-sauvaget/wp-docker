#!/bin/bash

# Charger les variables depuis le fichier .env
if [ -f "$(dirname "$0")/.env" ]; then
  set -a
  source "$(dirname "$0")/.env"
  set +a
else
  echo "❌ Fichier .env introuvable à $(dirname "$0") !"
  exit 1
fi
# Vérifier si WordPress est déjà installé
if wp core is-installed; then
  echo "🔄 WordPress est déjà installé, mise à jour des options..."

  # Mettre à jour les options principales de WordPress
  wp option update siteurl "$SITE_URL"
  wp option update home "$SITE_URL"
  wp option update blogname "$SITE_TITLE"

  # Mettre à jour les informations de l'administrateur
  wp user update admin --user_login="$ADMIN_USER" --user_pass="$ADMIN_PASS" --user_email="$ADMIN_EMAIL"

  echo "✅ Options mises à jour avec succès !"
else
  echo "⚙️ WordPress n'est pas installé, installation requise."
  wp core install --url="$SITE_URL" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_EMAIL"
fi

# Configuration des options courantes
echo "⚙️ Configuration des options..."

# Passage de WordPress en Français
wp language core install "$WP_LOCALE"
wp option update WPLANG "$WP_LOCALE"
wp option get WPLANG

# Installation des traductions des themes et plugins
wp language plugin install --all "$WP_LOCALE"
wp language theme install --all "$WP_LOCALE"

# Désactivation du cache
wp option update blog_public false       # Désactive l'indexation par les moteurs de recherche
wp transient delete --all                # Supprime tous les caches temporaires
wp cache flush                           # Vide le cache WP

# Définition du fuseau horaire + format de date
wp option update timezone_string "$TIMEZONE"
wp option update date_format "$DATE_FORMAT"
wp option update time_format "$TIME_FORMAT"

# Activer le mode debug
wp config set WP_DEBUG true --raw
wp config set WP_DEBUG_LOG true --raw
wp config set WP_DEBUG_DISPLAY false --raw

# Définir l'environnement (local, staging, production...)
wp config set WP_ENVIRONMENT_TYPE "development"
wp config set WP_DEVELOPMENT_MODE "all"

# Désactiver l'éditeur de fichiers dans l'admin
wp config set DISALLOW_FILE_EDIT true --raw

# Activer le mode debug pour les scripts et styles
wp config set SCRIPT_DEBUG true --raw

# Désactiver la concaténation des scripts JS
wp config set CONCATENATE_SCRIPTS false --raw
