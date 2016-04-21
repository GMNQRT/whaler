![logo](brand.png)

# Whaler
This project exposes a friendly user interface to Docker

## Getting Started

## Work with Docker !

### Pre-requisites
* Computer
* dokcer
* dokcer-compose

### Install steps

The docker-compose.yml contains directives to configure all containers.
```
git clone https://github.com/GMNQRT/whaler.git
cd whaler
git submodule update --init

docker-compose up
```
That's all folks !
Now visit localhost:3000 and see if it works

The default credentials are <b>admin@mail.fr</b> with the password <b>adminadmin</b>

## Without Docker

### Pre-requisites
* Computer
* Ruby 2.2.0
* MySQL server
* Redis server
* Logspout server

### Install steps
```
git clone https://github.com/GMNQRT/whaler.git
cd whaler
git submodule update --init
```

### Configure Whaler
You must update configuration files according to your MySQL and Redis configurations.

### Launch Whaler API <small>([see project](https://github.com/GMNQRT/whaler-api.git))</small>
Update MySQL configuration in `whaler-api/config/database.yml`  
Update MySQL configuration in `whaler-api/config/database.yml`  
Update Redis configuration in `whaler-api/config/initializers/websocket_rails.yml`

```
cd whaler-api
ruby bin/setup && bundle exec rails s -p 3000 -b '0.0.0.0'
```

### Launch Whaler event monitor
```
cd whaler-api
rake monit:event:start
```

### Launch Whaler UI <small>([see project](https://github.com/GMNQRT/whaler-ui.git))</small>
Update MySQL configuration in `whaler-ui/config/database.yml`

```
cd whaler-ui
ruby bin/setup && bundle exec rails s -p 80 -b '0.0.0.0'
```

### Launch Whaler Logs <small>([see project](https://github.com/GMNQRT/whaler-logs.git))</small>
Update Logspout and Redis configurations in `whaler-logs/server.rb`

```
cd whaler-logs
bundle
ruby server.rb
```

Now visit localhost:3000 and see if it works
