#!/bin/bash

# Désinstaller les themes par défaut de l'image WordPress
wp theme delete twentytwentythree
wp theme delete twentytwentyfour

# Activer par défaut le theme twentytwentyfive
wp theme activate twentytwentyfive
