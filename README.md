# wp-docker

Docker rend le développement local de WordPress beaucoup plus fluide et efficace.

## Installation

1. Mettre à jour les droits sur le dossier WordPress :

```bash
cd /path/to/project
sudo chown -R {your-username}:{your-username} wordpress
```

Cette commande permet de modifier les autorisations des fichiers WordPress pour qu'ils soient accessibles en écriture, ce qui est nécessaire pour travailler sur les fichiers depuis l'extérieur du conteneur Docker.

2. Renseigner le fichier .env

À partir du fichier `.env.sample`, renseignez vos propre variables d'environnement.

3. Lancer les conteneurs Docker :

```bash
docker compose up -d
```

4. Terminer la configuration du site :

Ouvrir un navigateur web vers http://localhost:8080, puis terminer l'installation du site manuellement ou passer à l'étape 5.

5. Installer des plugins, themes, réglages (Optionnel)

Rendre le script executable :

```bash
sudo chmod +x setup.sh
```

Lancer le script :

```bash
./setup.sh
```

Lance l'installation des plugins intéressant pour le développement et supprime des plugins et thèmes par défaut de l'image WordPress.

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
docker exec -it wordpress wp user create <username> <email> --role=a```administrator --user_pass=<password>
````
