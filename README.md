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

Cette commande est nécessaire car la façon dont Docker gère les autorisations de fichiers et de la façon dont l'image Docker wordpress est construite. Sans ce changement, on ne peut pas facilement éditer les fichiers du site WordPress depuis l'extérieur du conteneur Docker.

3. Terminer la création du site

Ouvrir un navigateur web vers http://localhost:8080, puis terminer l'installation du site.

## Qu'est-ce qui est inclus ?

Ce projet Docker pour WordPress inclut les services suivants :

- **WordPress**

  La dernière version de WordPress. Accessible à l'adresse http://localhost:8080.

- **MariaDB**

  La dernière version de MariaDB.

- **phpMyAdmin**

  Accessible à l'adresse http://localhost:8180.
