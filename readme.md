
# récupérer les sources :
```git clone ```

# Dockerfile
TODO

# Docker-compose
Le fichier de configuration docker-compose.yml contient toutes les directives de configuration pour créer les conteneurs web et db.
Les conteneurs web et db sont linkés.

Les variables d'environnement se retouvent dans les fichiers .env.web et .env.db pour leur conteneurs respectifs.
Modifier la variable DOCKER_URL dans .env.web pour mettre votre url de serveur Docker.

# Premier démarrage

Se placer dans le répertoire contenent les fichiers.
Il faut build les conteneurs. 
```docker-compose build```

Ensuite démarré les conteneurs 
```docker-compse up```

