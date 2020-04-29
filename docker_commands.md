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
  * --rm : remove the existing container with the same name
  
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
    Create and run a container named test. If it already exists, remove it and create again.
  
* Remove a container
  ```
  docker rm [OPTIONS] container_name (or container_id) [container_name...]
  ```
  Remove one or more containers.

* Start a container
  ```
  docker start [OPTIONS] container_name [container_name...]
  ```
  Start one or more stopped containers. Cannot be used to create a container.

* Attach a container
  ```
  docker attach [OPTIONS] container_name
  ```
  Attach local standard input, output, and error streams to a running container.

* Fetch the logs of a container
  ```
  docker logs [OPTIONS] container_name
  ```
  Options:
  * -f : follow log output
  * --tail n : numer of lines to show from the end of the logs
  * -t : show timestamps

* Stop the container
  ```
  docker stop [OPTIONS] container_name [container_name...]
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
  docker cp [OPTIONS] src_path container_name:dest_path
  ```

* Copy a file/directory from container to local filesystem
  ```
  docker cp [OPTIONS] container_name:src_path dest_path
  ```

  