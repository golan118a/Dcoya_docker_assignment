# Dcoya_docker_assignment
As part of a job interview I am required to complete a home assignment. 
This repository will hold all the neccesery files and documantation for this assignment.

![image](https://github.com/user-attachments/assets/6b5e75bf-f7fd-471b-9552-c2235be7ce3b)

 ====== Global Variables: =======
 
VM user (yontan) password: HireMe!
MySQL Root password: HireYoni13!
DB name: Dcoya
app container name: app1
sql container name: sql1
container network name: net1

(all the files have a copy at the VM /home/ folder)

app scripts are at /home/ on the app container

mysql credentials are saved at both containers at /etc/mysql/my.cnf
(in the app container the host name is sql1, in the sql container its local host)

mysql init file is saved at /docker-entrypoint-initdb.d/init.sql

the VM systemd startup service is saved at /etc/systemd/system/startup.service

 ====== My Proccess: =======
 
installed docker on VM

made an SQL container from SQL image with predifined mysql root password
made an app container from Ubuntu image

in the sql container:
- made a DB named Dcoya
- using Dcoya, made a Table named users

in tha app container:
- installed sql client
- changed default mysql credentials to use the mysql root password that was predefined
- wrote 2 scripts:
  1. from the mysql server at the sql container, using Dcoya DB, read the users table
  2. from the mysql server at the sql container, using Dcoya DB, write user input to the users table

in order to communicate between the containers i made a simple docker network and connected the 2 containers

after making sure the communication and the scripts are working i went to create the script in the VM (Docker Host) that will call the scripts in the app container

next step was to call the proxy script from the Windows PC (VM Host) with a simple SSH,
after installing SSH on the windows PC, using the VMBox interface i enabled port forwarding from port 22 (SSH) of the windows host to port 22 of the VM.
because the VirtualBox is running localy on the PC, i executed the SSH command to user@local host (in this case the user is yonatan@localhost) with the user password.

all the application, mysql server and proxy script works amazing.

next is to make sure everything starts up when we turn on the VM.

To make scripts to run on container startup everything is needed to be in the image or more specificaly the dockerfile that will build the image.

The MySQL server already has an init service built in, all we need to do is change it to make sure we have the DB and the Table.

The app container needed to copy the app scripts and the mysql client credentials and ofcourse install the mysql client.

The VM also has a script that will be called on startup using the systemd pid. 
The script checks with docker the containers and the network are up and if not, start or run them.

Last step, using the VirtualBox exporting the VM as an OVA and uploadind everything to GitHub.

Next challenges:
- making the scripts in python
- checking the user input
- logging the calls to the app container in the VM
- connecting the containers with SSL
- create a cron job at the VM to call and log data_read every day

