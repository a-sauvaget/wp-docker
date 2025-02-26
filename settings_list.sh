#!/bin/bash

# Passage de WordPress en Français
wp language core install fr_FR
wp option update WPLANG fr_FR
wp option get WPLANG

# Installation des traductions des themes et plugins
wp language plugin install --all fr_FR
wp language theme install --all fr_FR

# Activer le mode debug
wp option update wp_debug 1
wp option update wp_debug_log 1
wp option update wp_debug_display 0

# Désactivation du cache
wp option update blog_public 0  # Désactive l'indexation par les moteurs de recherche
wp transient delete --all       # Supprime tous les caches temporaires
wp cache flush                  # Vide le cache WP

# Définition du fuseau horaire + format de date
wp option update timezone_string "Europe/Paris"
wp option update date_format "d/m/Y"
wp option update time_format "H:i"

# Désactiver l'éditeur de fichiers dans l'admin
wp option update disallow_file_edit 1
