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
| `docker container ls -aq` | xargs docker container stop` |  |
| `docker container ls -aq` | xargs docker container rm` |  |
| `docker container ls -aq` | xargs docker container stop; docker container ls -aq | xargs docker container rm;` |  |
|  |  |
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

#### Docker Log
| Command | Description|
| --- | --- |
| `docker login` | always do logout after your done |
| `docker logout` |  |

### Docker File
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)


### Docker Repositories
- [Docker Store](https://store.docker.com/)
- [Docker Hub](https://hub.docker.com/explore/)


### References 

