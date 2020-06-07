# Commands for docker
* Create a new container
  ```
  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
  ```
  Creates a writeable container layer over the specified image and then starts it using the specified command. 
  Options :
  * -i : keep the standard input open
  * -t : allocate a pseudo-tty
  * -d : run a container in background and print container id
  * --name container_name : assign name to container. If the name is not specified docker automatically creates one
  * -e : set environment variables
  * -p <host_port>:<container_port> : map the host port to the container port 
  * --rm : automatically removes the container once it exists
  
    EXAMPLES:
    ``` 
    docker run --name test -itd ubuntu bin/bash
    ```
    Create and run a container, in background, named test using the ubuntu imange. The -id instructs docker to allocate a pseudo-tty connected to the container's stdin, thus creating an interactive bash shell in the container.
    ```
    docker run --name pg_test -e POSTGRES_PASSWORD=mysecretpassword -d -p 5433:5432 postgres
    ```
    Create and run a container, in background, named pg_test using the postgres image.
    Set the environment varibale POSTGRES_PASSWORD and map port 5433 on your local machine to 5432 on the container.
    ```
    docker run --rm --name test -d ubuntu
    ```
    Create and run a container named test. When the container is stopped, it is removed.
  
* Remove a container
  ```
  docker rm [OPTIONS] CONTAINER (or CONTAINER ID) [CONTAINER...]
  ```
  Remove one or more containers.

* Start a container
  ```
  docker start [OPTIONS] CONTAINER [CONTAINER...]
  ```
  Start one or more stopped containers. Cannot be used to create a container.

* Attach a container
  ```
  docker attach [OPTIONS] CONTAINER
  ```
  Attach local standard input, output, and error streams to a running container.

* Fetch the logs of a container
  ```
  docker logs [OPTIONS] CONTAINER
  ```
  Options:
  * -f : follow log output
  * --tail n : numer of lines to show from the end of the logs
  * -t : show timestamps

* Stop the container
  ```
  docker stop [OPTIONS] CONTAINER [CONTAINER...]
  ```

* List containers
  ```
  docker ps [OPTIONS]
  ```
  Options:
  * -a : show all containers, by default ps only shows the running containers
  * -s : display total file sizes

* List docker images
  ```
  docker images [OPTIONS] [REPOSITORY[:TAG]]
  ```

* Pull a specific image or a repository from a registry
  ```
  docker pull [OPTIONS] NAME[:TAG|@DIGEST]
  ```
  Most of your images will be created on top of a base image from the Docker Hub (which contains many pre-build images) registry.
  EXAMPLE:
  ```
  docker pull ubuntu:16.04
  ```

* Search for docker images
  ```
  docker search [OPTIONS] TERM
  ```
  Search Docker Hub for TERM

* Copy a file/directory from local filesystem to container
  ```
  docker cp [OPTIONS] src_path CONTAINER:dest_path
  ```

* Copy a file/directory from container to local filesystem
  ```
  docker cp [OPTIONS] CONTAINER:src_path dest_path
  ```

* Build an image from dockerfile:
  ```
  docker build [OPTIONS] PATH URL
  ```
  Options:
  * -f path/Dockerfile : specify the dockerfile
  * -t image_name: tag a name to the image

  EXAMPLES:
  ```
  docker build .
  ```
  . specifies to search for the docker in the local directory
  ```
  docker build -f PATH/Dockerfile .
  ```
  ```
  docker build -t IMAGE .
  ```

* Remove image:
  ```
  docker rmi [OPTIONS] IMAGE [IMAGE...]
  docker image rm [OPTIONS] IMAGE [IMAGE...]
  ```

* Execute a command in a running container:
  ```
  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
  ```
  EXAMPLE:
  ```
  docker exec -it bdss bin/bash
  ```
  Execute an iteratictive bash shell on the container named bdss. Only work on running containers.

* Create a volume:
  ```
  docker run -v ABS_PATH_HOST:ABS_PATH_CONTAINER --name CONTAINER IMAGE
  ```
  A volume is a directory created outisde of the Union File System, in the host filesystem. It is used to save and share data between containers.
  -v in the run command allows to mount a directory in the host into a directory in the container.
  --read-only: the dir is read only.

* Start a docker compose
  ```
  docker-compose up
  ```
  
  
<!-- # Dockerfile
Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

When you issue a docker build command, the current working directory is called the build context.

The build is run by the Docker daemon, not by the CLI. The first thing a build process does is send the entire context (recursively) to the daemon. In most cases, it’s best to start with an empty directory as context and keep your Dockerfile in that directory. Add only the files needed for building the Dockerfile.

The docker build command builds an image from a Dockerfile and a context. The build’s context is the set of files at a specified location PATH or URL. The PATH is a directory on your local filesystem. The URL is a Git repository location. -->



Source: Docker documentation (docs.docker.com)