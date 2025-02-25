# Utiliser l'image officielle WordPress comme image de base
FROM wordpress:latest

# Mettre à jour les packages et installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y curl git unzip && \
    rm -rf /var/lib/apt/lists/*

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installer WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Créer un utilisateur non-root pour exécuter WP-CLI
RUN useradd -m wpcliuser

# Définir le mot de passe de l'utilisateur
RUN echo 'wpcliuser:${WPCLIUSER_PASSWORD}' | chpasswd

# Donner les permissions nécessaires au nouvel utilisateur
RUN chown -R wpcliuser /var/www/html
#RUN chown -R wpcliuser /var/www/html/wp-content


# Définir l'utilisateur non-root comme utilisateur par défaut
USER wpcliuser
