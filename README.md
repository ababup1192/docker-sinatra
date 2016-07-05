# docker-sinatra

[docker document](https://gist.github.com/ababup1192/50eff1475681f9d8f67098ba9fdd92c5 "docker document")

## Install

- [Docker tool box](https://www.docker.com/products/docker-toolbox "Docker tool box")
- [Virtual Box](https://www.docker.com/products/docker-toolbox "Virtual Box")

## Setting Docker Engine

```
$ docker-machine create --driver virtualbox default
$ eval "$(docker-machine env default)"
```

## Run docker-sinatra

```
$ docker-compose build
# Please retype this command if the container occurs some error.
$ docker-compose run web bundle exec rake db:migrate
$ docker-compose up
$ curl -X POST -d '{"msg": "abc"}' http://$(docker-machine ip):4567/words
$ curl -X POST -d '{"msg": "def"}' http://$(docker-machine ip):4567/words
$ curl http://$(docker-machine ip):4567/words
```

## Destroy Docker environment
```
$ docker-machine rm default
```
