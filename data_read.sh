#!/bin/bash

{
	mysql -e "use Dcoya; select * from users;" &&
	echo "success"
} || {
	echo "failed"
}

echo "done"
