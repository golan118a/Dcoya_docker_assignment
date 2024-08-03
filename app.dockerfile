# this is a docker file to build an image for the application with the scripts that will reach the sql server

FROM ubuntu:latest

RUN apt-get update && apt-get install -y  mysql-client

COPY data_read.sh /home/data_read.sh
COPY data_write.sh /home/data_write.sh
COPY my.cnf /etc/mysql/my.cnf

ENV MYSQL_ROOT_PASSWORD=HireYoni13!
ENV MYSQL_DATABASE=Dcoya
ENV MYSQL_TABLE=users
ENV MYSQL_HOST=sql1
