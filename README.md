# BookApi
A PoC about ASP Web Core with Swagger and Docker

## Create ASP Web API core project
```bash
dotnet new webapi -o BooksApi
```

## Add MongoDB Driver and Swashbuckle project dependencies
```bash
dotnet add BooksApi.csproj package MongoDB.Driver
dotnet add package Swashbuckle.AspNetCore
```

## Build project
```bash
dotnet build
```

## Start project
```bash
dotnet run
```

## Test application from https (We have problems with Swagger)
```bash
curl --insecure https://localhost:5001/api/books
```

## Test application from http (Is possible is comment the redirection from StartUp Configure)
```bash
curl http://localhost:5000/api/books
```

## To access swagger web ui
```bash
http://localhost:5000/swagger/index.html
```

![Swagger](https://user-images.githubusercontent.com/1216181/79368057-1b933e80-7f4f-11ea-96ed-257ce9e4784f.png)

## Some docker commands
```bash
docker images
docker rmi <IMAGE_ID>
docker container ps -all
docker container rm <CONTAINER_ID>
docker container stop <CONTAINER_ID>
docker container start <CONTAINER_ID>
```

## Build docker image
```bash
docker build -t bookapi .
```

## Start docker container shared docker port 80 to 5000 (Problems to access MongoDB)
```bash
docker run -d --name bookapi -p 5000:80 bookapi
```

## Test docker container (We will have problems with the MongoDB Connection)
```bash
curl http://localhost:5000/api/books
```

## Start docker container shared host network
```bash
docker run -d --name bookapi -e ROOT_URL=http://localhost -e MONGO_URL=mongodb://localhost:27017 --network="host" bookapi
```

## Test docker container
```bash
curl http://localhost/api/books
```

## Build connect to docker container
```bash
docker run -it bookapi /bin/bash
```