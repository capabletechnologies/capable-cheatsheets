##############################################################################
# DOCKER
##############################################################################

docker init                             # Generates Docker-related starter files
docker build -t friendlyname .          # Build an image using the Dockerfile in this directory
docker run -p 4000:80 friendlyname      # Run "friendlyname" and map port 4000 to 80
docker run -d -p 4000:80 friendlyname   # Run "friendlyname" in detached mode and map port 4000 to 80
docker exec -it [container-id] bash     # Access a running container
docker ps                               # Display all running containers
docker stop <hash>                      # Gracefully stop the specified container
docker ps -a                            # Display all containers, including those that are stopped
docker kill <hash>                      # Forcefully stop the specified container
docker rm <hash>                        # Remove the specified container from the machine
docker rm -f <hash>                     # Forcefully remove the specified container from the machine
docker rm $(docker ps -a -q)            # Remove all containers from the machine
docker images -a                        # List all images on the machine
docker rmi <imagename>                  # Delete the specified image from the machine
docker rmi $(docker images -q)          # Delete all images from the machine
docker logs <container-id> -f           # Continuously follow a container's logs
docker login                            # Log in to this CLI session with your Docker credentials
docker tag <image> username/repository  # Tag an image for upload to a registry
docker push username/repository         # Push a tagged image to a registry
docker run username/repository          # Run an image from a registry
docker system prune                     # Remove all unused containers, networks, images (dangling and unreferenced), and optionally, volumes (Docker 17.06.1-ce and later)
docker system prune -a                  # Remove all unused containers, networks, and images, not just dangling ones (Docker 17.06.1-ce and later)
docker volume prune                     # Remove all unused local volumes
docker network prune                    # Remove all unused networks


##############################################################################
# DOCKER COMPOSE
##############################################################################


docker-compose up                                        # Build, (re)create, start, and attach to containers for a service
docker-compose up -d                                     # Build, (re)create, start, and detach from containers for a service
docker-compose down                                      # Stop and remove containers, networks, images, and volumes
docker-compose logs                                      # View output from containers
docker-compose restart                                   # Restart all services
docker-compose pull                                      # Pull service images
docker-compose build                                     # Build service images
docker-compose config                                    # Validate and view the Compose file
docker-compose scale <service_name>=<replica>            # Set the number of containers for a service
docker-compose top                                       # Display the running processes
docker-compose run -rm -p 2022:22 web bash               # Start the web service and run bash as its command, removing the old container

##############################################################################
# DOCKER SERVICES 
##############################################################################


docker service create <options> <image> <command>     # Create a new service
docker service inspect --pretty <service_name>        # Display detailed information about a service
docker service ls                                     # List services
docker service ps                                     # List the tasks of services
docker service scale <service_name>=<replica>         # Scale a service
docker service update <options> <service_name>        # Update service options


##############################################################################
# DOCKER STACK 
##############################################################################


docker stack ls                                       # List all running applications on this Docker host
docker stack deploy -c <composefile> <appname>        # Run the specified Compose file
docker stack services <appname>                       # List the services associated with an app
docker stack ps <appname>                             # List the running containers associated with an app
docker stack rm <appname>                             # Tear down an application


##############################################################################
# DOCKER MACHINE
##############################################################################


docker-machine create --driver virtualbox myvm1                              # Create a VM (Mac, Win7, Linux)
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1     # Create a VM using Hyper-V on Win10
docker-machine env myvm1                                                     # Display basic information about your node
docker-machine ssh myvm1 "docker node ls"                                    # List the nodes in your swarm
docker-machine ssh myvm1 "docker node inspect <node ID>"                     # Inspect a node
docker-machine ssh myvm1 "docker swarm join-token -q worker"                 # Display the join token for a worker
docker-machine ssh myvm1                                                     # Open an SSH session with the VM; type "exit" to end
docker-machine ssh myvm2 "docker swarm leave"                                # Make the worker leave the swarm
docker-machine ssh myvm1 "docker swarm leave -f"                             # Make the master leave, and kill the swarm
docker-machine start myvm1                                                   # Start a VM that is currently not running
docker-machine stop $(docker-machine ls -q)                                  # Stop all running VMs
docker-machine rm $(docker-machine ls -q)                                    # Delete all VMs and their disk images
docker-machine scp docker-compose.yml myvm1:~                                # Copy a file to the node's home directory
docker-machine ssh myvm1 "docker stack deploy -c <file> <app>"               # Deploy an app
