# BookApi
A PoC about ASP Web Core with Swagger and Docker

## Create ASP Web API core project
dotnet new webapi -o BooksApi

## Add MongoDB Driver and Swashbuckle project dependencies
dotnet add BooksApi.csproj package MongoDB.Driver
dotnet add package Swashbuckle.AspNetCore

## Build project
dotnet build

## Start project
dotnet run

## Test application from https (We have problems with Swagger)
curl --insecure https://localhost:5001/api/books

## Test application from http (Is possible is comment the redirection from StartUp Configure)
curl http://localhost:5000/api/books

## Some docker commands
docker images
docker rmi <IMAGE_ID>
docker container ps -all
docker container rm <CONTAINER_ID>
docker container stop <CONTAINER_ID>
docker container start <CONTAINER_ID>


## Build docker image
docker build -t bookapi .

## Start docker container shared docker port 80 to 5000 (Problems to access MongoDB)
docker run -d --name bookapi -p 5000:80 bookapi

## Test docker container (We will have problems with the MongoDB Connection)
curl http://localhost:5000/api/books

## Start docker container shared host network
docker run -d --name bookapi -e ROOT_URL=http://localhost -e MONGO_URL=mongodb://localhost:27017 --network="host" bookapi

## Test docker container
curl http://localhost/api/books

## Build connect to docker container
docker run -it bookapi /bin/bash