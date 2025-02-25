# wp-docker

Docker rend le développement local de WordPress beaucoup plus fluide et efficace.

## Installation

1. Lancer la commande :

```bash
docker compose up
```

2. Une fois que tout est ok, lancer la commande :

```bash
cd /path/to/project
sudo chown -R {your-username}:{your-username} wordpress
```

Cette commande est nécessaire car la façon dont Docker gère les autorisations de fichiers et de la façon dont l'image Docker WordPress est construite. Sans ce changement, on ne peut pas facilement éditer les fichiers du site WordPress depuis l'extérieur du conteneur Docker.

3. Terminer la création du site

Ouvrir un navigateur web vers http://localhost:8080, puis terminer l'installation du site.

## Qu'est-ce qui est inclus ?

Ce projet Docker pour WordPress inclut les services suivants :

- **WordPress**

  La dernière version de WordPress. Accessible à l'adresse http://localhost:8080.

- **MariaDB**

  La version LTS de MariaDB.

- **phpMyAdmin**

  Accessible à l'adresse http://localhost:8180.

- **WP-CLI**

  Outil en ligne de commande pour administrer WordPress directement depuis le conteneur, permettant d'effectuer diverses actions comme l'installation de plugins, la mise à jour de WordPress, ou la gestion des utilisateurs.

## Utilisation de WP-CLI

WP-CLI est inclus dans ce projet Docker pour gérer l'installation WordPress via la ligne de commande.

### Commandes WP-CLI

Une fois votre projet Docker en cours d'exécution, vous pouvez exécuter des commandes WP-CLI à l'intérieur du conteneur wordpress. Par exemple, pour obtenir des informations sur la configuration de WP-CLI, exécutez la commande suivante :

```bash
docker exec -it wordpress wp --info
```

Cette commande vous fournira des informations détaillées sur la version de WP-CLI, PHP, ainsi que sur la configuration actuelle de WordPress.

WP-CLI peut également être utilisé pour effectuer diverses actions de gestion de votre installation WordPress. Quelques exemples d'utilisation incluent :

- Installation de plugins :

```bash
docker exec -it wordpress wp plugin install <plugin-name> --activate
```

- Mise à jour de WordPress :

```bash
docker exec -it wordpress wp core update
```

- Création d'un nouvel utilisateur WordPress :

````bash
docker exec -it wordpress wp user create <username> <email> --role=a```dministrator --user_pass=<password>
````
