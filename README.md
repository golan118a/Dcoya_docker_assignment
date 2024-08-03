# Dcoya_docker_assignment
As part of a job interview I am required to complete a home assignment. 
This repository will hold all the neccesery files and documantation for this assignment.

![image](https://github.com/user-attachments/assets/6b5e75bf-f7fd-471b-9552-c2235be7ce3b)

Enter the MySQL container and into the SQL cli
Docker exec -it <sql_container_name> mysql -uroot -p 

Run the MySQL container
Docker run -d --name <sql_container_name>  -e TZ=UTC - p 30306:3306 -e MYSQL_ROOT_PASSWORD=<password> Ubuntu/mysql:8.0-22.04_beta

Run the app container with the detach flag because of ___
Docker run -dit --name <container_name> <image_name>

-dit = 

Enter the app container (bash cli by default)
Docker exec -it -u root <app_container_name> /bin/bash

-it =

From app container to MySQL server
First install MySQL client then run the command
Mysql -u root -p -h <mysql_container_ip> -e "<SQL commands>"

It is very important to mention that in order to use the MySQL client from the app1 container on the MySQL server, I first changed the my.cnf (/etc/mysql/my.cnf) file to look like this:
[client]
User=root
Password=<password>
Host=<mysql_container_ip_or_name>

To enable network between the containers:
Docker network create <network_name>
Docker network ls
Docker network inspect <network_name>
Docker network connect <network_name> <container_name>

The proxy script in the VM host works like:
asdgadfg

To enable SSH from Win PC Host to VM we first need to configure the port forwarding from the pc to the vm: 
Port 22 (SSH) from host to port 22 at the guest meaning the VM



Copy files from docker to host (this case is the VM)
sudo docker cp <container_id>:/<src_file_location> <dst_file_location>

For the SQL container in order to initialise the table and DB all I need to do is write an init.sql file and save it in the container at /docker-entrypoint-initdb.d/

Build an image from a docker file 
docker build -f <MyDockerfile> -t <my_custom_image> .

-f MyDockerfile: Specifies that the Dockerfile is named MyDockerfile.
-t my_custom_image: Tags the image with the name my_custom_image.
.: Specifies the current directory as the build context.


