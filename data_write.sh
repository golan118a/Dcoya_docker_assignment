#!/bin/bash

echo "please enter your name:"
read user_name

echo "please enter your age:"
read user_age

{
	mysql -e "use Dcoya; INSERT INTO users (name,age) VALUES ('$user_name', $user_age );" &&
	echo "success. entered name:$user_name and age:$user_age into the DB. "
} || {
	echo "failed"
}

echo "done"
