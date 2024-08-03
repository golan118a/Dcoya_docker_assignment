# this is a docker file to build an image for the sql server with the script to create the users table

FROM ubuntu/mysql:latest

COPY init.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=HireYoni13!
ENV MYSQL_DATABASE=Dcoya
ENV MYSQL_TABLE=users
