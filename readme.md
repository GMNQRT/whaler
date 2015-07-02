# Get sources
Clone the main repo:

    git clone https://gitlab.loterman.net/Docker/Whaler-api_compose.git whaler

Then pull modules:

    cd whaler
    git submodule update --init



# Dockerfile
TODO

# Docker-compose
The docker-compose.yml contains directives to configure containers for both ui, api and db.
api and ui are both linked to the db container.

# First start
Go to the docker-compose.yml folder and build images of whaler-api and whaler-ui projects

    docker-compose build

Download assets

    docker-compose run ui rake bower:install['--allow-root']

Build the database

    docker-compose run api rake db:create
    docker-compose run api rake db:seed

Then start all containers

    docker-compose up
