#!/bin/bash

CONTAINER_NAME="app1"
WRITE_SCRIPT_PATH="/home/data_write.sh"
READ_SCRIPT_PATH="/home/data_read.sh"

if [ "$(docker ps -q -f name=sql1)" == ""  ]; then 
        echo "SQL container is not running"
        exit
else 
        echo "SQL Container is up and running"
fi

echo "Which action would you like to do? 
[1] write 
[2] read"

read user_input

if [[ $user_input -eq 1 ]]; then
	echo "you have chosen to write data"
	docker exec -it $CONTAINER_NAME bash -c "$WRITE_SCRIPT_PATH"
elif [[ $user_input -eq 2 ]]; then 
	echo "you have chosen to read data"
	docker exec -it $CONTAINER_NAME bash -c "$READ_SCRIPT_PATH"
else
	echo "no availabe option has been chosen"
fi

