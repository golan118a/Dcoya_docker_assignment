#!/bin/bash

NETWORK_NAME="net1"
APP_CONTAINER="app1"
SQL_CONTAINER="sql1"

# check if docker is running
if ! sudo systemctl is-active --quiet docker; then
	echo "Docker is'nt up. Starting Docker..."
	sudo systemctl start docker
else
	echo "docker is already up"
fi

#check if the docker network is up and running. start it if not.
if ! sudo docker network inspect $NETWORK_NAME >/dev/null 2>&1; then
	echo "net1 is'nt up. Starting docker network..."
	sudo docker network create $NETWORK_NAME
else
	echo "network is already up"
fi

#check if the sql container is running
if [ "$(docker ps -q -f name=sql1)" == "" ]; then
	if [ "$(docker ps -aq -f status=exited -f name=$SQL_CONTAINER)" != "" ]; then
		echo "Starting SQL container..."
		sudo docker start $SQL_CONTAINER
	else
		echo "Running new SQL container"
		sudo docker run -dit --name $SQL_CONTAINER --network $NETWORK_NAME sql_img
	fi
else
	echo "sql container is already up"
fi

#check if the app container is up
if [ "$(docker ps -q -f name=app1)" == "" ]; then
        if [ "$(docker ps -aq -f status=exited -f name=$APP_CONTAINER)" != "" ]; then
                echo "Starting app container..."
                sudo docker start $APP_CONTAINER
        else
                echo "Running new app container"
                sudo docker run -dit --name $APP_CONTAINER --network $NETWORK_NAME app_img
        fi
else
	echo "app container is already up"
fi

echo "all checks completed"


