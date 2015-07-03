# Get sources
Clone the main repo:

    git clone https://gitlab.loterman.net/Docker/Whaler-api_compose.git whaler

Then pull modules:

    cd whaler
    git submodule update --init

# Docker-compose
The docker-compose.yml contains directives to configure containers for both ui, api and db.
api and ui are both linked to the db container.

# First start
Go to the docker-compose.yml folder and build images of whaler-api and whaler-ui projects

    docker-compose build

Then start all containers

    docker-compose up
    
Cento OS 6.6
---------------

    sudo yum update

    yum install docker.io

docker-compose

    curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

