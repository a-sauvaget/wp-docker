# wp-docker

## Installation

Lancer la commande :

```bash
docker compose up
```

Une fois que tout est ok, lancer la commande :

```bash
sudo chown -R {your-username}:{your-username} wordpress
```

Cette commande est nécessaire car la façon dont Docker gère les autorisations de fichiers et de la façon dont l'image Docker wordpress est construite. Sans ce changement, on ne peut pas facilement éditer les fichiers du site WordPress depuis l'extérieur du conteneur Docker.
