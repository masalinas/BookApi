# BookApi
A PoC about ASP Web Core with Swagger and Docker

# create ASP Web APi core project
dotnet new webapi -o BooksApi

# add MongoDB Driver and Swashbuckle project dependencies
dotnet add BooksApi.csproj package MongoDB.Driver
dotnet add package Swashbuckle.AspNetCore

# build project
dotnet build

# start project
dotnet run

# test application from https (We have problems with Swagger)
curl --insecure https://localhost:5001/api/books

# test application from http (Is possible is comment the redirection from StartUp Configure)
curl http://localhost:5000/api/books

# build docker image
docker build -t bookapi .

# start docker container shared docker port 80 to 5000 (Problems to access MongoDB)
docker run -d --name bookapi -p 5000:80 bookapi

# test docker container (We will have problems with the MongoDB Connection)
curl http://localhost:5000/api/books

# start docker container shared host network
docker run -d --name bookapi -e ROOT_URL=http://localhost -e MONGO_URL=mongodb://localhost:27017 --network="host" bookapi

# test docker container
curl http://localhost/api/books

# build connect to docker container
docker run -it bookapi /bin/bash