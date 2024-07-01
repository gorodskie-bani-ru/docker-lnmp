# Introduction

Deploy lnmp(Linux, Nginx, MySQL, PHP7) using docker.

I want to share my ideas and designs about Web-Deploying using Docker with you.

### Architecture

![architecture][1]

The whole app is divided into three Containers:

1. Nginx is running in `Nginx` Container, which handles requests and makes responses.
2. PHP or PHP-FPM is put in `PHP-FPM` Container, it retrieves php scripts from host, interprets, executes then responses to Nginx. If necessary, it will connect to `MySQL` as well.
3. MySQL lies in `MySQL` Container, 

Our app scripts are located on host, you can edit files directly without rebuilding/restarting whole images/containers.

### set DOCKER_BUILDKIT=0

https://github.com/moby/buildkit/issues/978#issuecomment-686420433

```sh
export DOCKER_BUILDKIT=0
```

### Build and Run

At first, you should have had [Docker](https://docs.docker.com) and [Docker Compose](https://docs.docker.com/compose) installed.

Copy .env file and edit
    
    $ copy .sample.env .env

Without building images one by one, you can make use of `docker-compose` and simply issue:

    $ sudo docker-compose up

For more operations to containers, please refer to:

    $ sudo docker-compose --help

Check out your http://\<docker-host\> and have fun :beer:

### Contributors

Micooz <micooz@hotmail.com>

sndnvaps <sndnvaps@gmail.com>

### License

MIT

  [1]: architecture.png


### Total

front_old Не используется

