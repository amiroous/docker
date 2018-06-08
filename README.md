# [Docker](https://www.docker.com/)

### Installation:
- Download [Docker Community Edition](https://www.docker.com/community-edition) (Free)
    * to see Mac OS `sw_vers`
    * to see Linux OS `cat /etc/*release*`

### Docker CLI
- Docker Command Line ([CLI](https://docs.docker.com/engine/reference/commandline/cli/))
- [Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)

#### Docker Global
| Command | Description|
| --- | --- |
| `docker` |  |
| `docker version` |  |
| `docker info` |  |

#### Docker Container
| Command | Description|
| --- | --- |
| `docker container --help` |  |
| `docker container ls` | List containers (`docker ps`) |
| `docker container ls --help` |  |
| `docker container ls -a` |  |
| `docker container ls -aq &#124; xargs docker container stop` |  |
| `docker container ls -aq &#124; xargs docker container rm` |  |
| `docker container ls -aq &#124; xargs docker container stop; docker container ls -aq &#124; xargs docker container rm;` |  |
| `docker container ls -aq &#124; xargs docker container stop; docker container ls -aq &#124; xargs docker container rm;` |  |
| `docker container stop $(docker container ls -aqf name=memcached_api)` |  |
| `docker container run` | Run a command in a new container (more things behind the scene) |
| `docker container run --publish 80:80 --name mylocalhost --detach nginx` | Host (Machine) Port : Docker Container Port |
| `docker container run -p 80:80 --name mylocalhost -d nginx` |  |
| `docker container run -p 80:80 --name mylocalhost -it nginx bash` | Run Interactive + allocate a pseudo-TTY |
| `docker container port mylocalhost` | _80/tcp -> 0.0.0.0:80_ |
| `docker container inspect --format '{{ .NetworkSettings.IPAddress }}' mylocalhost` | _172.17.0.2_ |
| `docker container run -p 80:80 --name mylocalhost --network mynetwork -d nginx` |  |
| `docker container run -it --rm --name myos ubuntu` | Remove container once exit (--rm) |
|  |  |
| `docker container exec` | Run a command in a running container |
| `docker container exec -it ubuntu bash` | |
|  |  |
| `docker container start` | Start one or more stopped containers |
| `docker container start -ai ubuntu` | Start Interactive + allocate a pseudo-TTY |
|  |  |
| `docker container stop` | Stop one or more running containers |
|  |  |
| `docker container rm` | Remove one or more containers |
|  |  |
| `docker container logs mylocalhost` | Fetch the logs of a container |
| `docker container logs  -f mylocalhost` | Fetch the logs of a container and follow it |
| `docker container top mylocalhost` | Display the running processes of a container |
| `docker container inspect mylocalhost` | Display detailed information on one or more containers |
| `docker container stats` | Display a live stream of container(s) resource usage statistics |

#### Docker Network
| Command | Description|
| --- | --- |
| `docker network --help` |  |
| `docker network ls` | List networks (bridge, host, none) |
| `docker network inspect <network>` | Display detailed information on one or more networks |
| `docker network create --driver <network>` | Create a network |
| `docker network connect <network> <container>` | Connect a container to a network |
| `docker network disconnect  <network> <container>` | Disconnect a container from a network |
| `docker network rm <network>` | Remove one or more networks |
| `docker network prune` | Remove all unused networks |

#### Docker Image
| Command | Description|
| --- | --- |
| `docker history IMAGE[:TAG]` | Show the history of an image |
| `docker image ls` |  |
| `docker image ls -aq` |  |
| `docker image rm IMAGE[:TAG]` |  |
| `docker image pull IMAGE[:TAG]` |  |
| `docker image push IMAGE[:TAG]` |  |
| `docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]` |  |
| `docker image build -t [:TAG] . ` |  |

#### Docker Log
| Command | Description|
| --- | --- |
| `docker login` | always do logout after your done |
| `docker logout` |  |


#### Docker Compose
> Combination of command line tools [CLI](https://docs.docker.com/compose/reference/) and a [configuration file](https://docs.docker.com/compose/compose-file/#compose-file-structure-and-examples).
> Compose is a tool for defining and running multi-container Docker applications

| Command | Description|
| --- | --- |
| `docker-compose --help` |  |
| `docker-compose -f <docker-compose-file-name>` |  |
| `docker-compose up` | setup volumes/networks and start all containers |
| `docker-compose down` | stop all containers and remove container/volume/networks |
| `docker-compose down -v` |  |
| `docker-compose down -v --rmi` |  |

* `docker-compose.yml` is default config file but could be anything you want (use `docker-compose -f <docker-compose-file-name>`)

```dockerfile
# if no version is specificed then v1 is assumed. Recommend v2 minimum
version: '3.1'

# containers. same as docker run
services:

    # a friendly name. this is also DNS name inside network
    servicename:
        
        # Optional if you use build:
        image:
        
        # Optional, replace the default CMD specified by the image
        command:
        
        # Optional, same as -e in docker run
        environment:
        
        # Optional, same as -v in docker run
        volumes:
        
    servicename2:

# Optional, same as docker volume create
volumes:

# Optional, same as docker network create
networks:


```

### Docker File
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)

1. Create the Dockerfile
2. Build the Image

```dockerfile
# FROM <image>[:tag]
### Sets the Base Image for subsequent instructions
### a valid Dockerfile must start with a FROM instruction

# COPY <src>... <dest>
### add directories and files to your Docker image

# ADD <src>... <dest>
### add directories and files to your Docker image
### has extra features compared to COPY that make ADD more unpredictable and a bit over-designed

# ENV <key> <value>
# ENV <key>=<value> ...
### used to define environment variables

# RUN <command>
# RUN ["executable", "param1", "param2"]
### will execute commands in a new layer
### RUN <command> will invoke a shell automatically (/bin/sh -c by default)

# VOLUME ["/var/log/", "/var/db"]
# VOLUME /var/log /var/db
### 
### creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers.

# USER <user>[:<group>]
### sets the user name (or UID) and optionally the user group (or GID) to use when running the image and for any RUN, CMD and ENTRYPOINT instructions that follow it in the Dockerfile

# WORKDIR </path/to/workdir>
### sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfil
### if the directory does not exists, Docker will create it for you.

# EXPOSE <port> [<port>/<protocol>...]
### informs Docker that the container listens on the specified network ports at runtime. 
### You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified.

# ENTRYPOINT ["executable", "param1", "param2"]
# ENTRYPOINT command param1 param2 (shell form)
### allows you to configure a container that will run as an executable 

# CMD ["executable","param1","param2"]
# CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
# CMD command param1 param2 (shell form)
### to provide defaults for an executing container
### there can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.





```


### Docker Repositories
- [Docker Store](https://store.docker.com/)
- [Docker Hub](https://hub.docker.com/explore/)


### References 

