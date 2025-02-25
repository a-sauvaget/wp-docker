#!/bin/bash

# Désinstaller les plugins par défaut de l'image WordPress
wp plugin delete hello
wp plugin delete akismet

# Installer et activer des plugins
wp plugin install debug-bar --activate
wp plugin install debug-this --activate
wp plugin install query-monitor --activate
wp plugin install theme-check --activate
