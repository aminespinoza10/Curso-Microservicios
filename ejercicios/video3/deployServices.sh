#!/bin/bash

# Crea los nueve proyectos para cada uno de los servicios
projectsList=("GetAdults" "GetChildren" "GetAdultById" "GetChildById" "AddMember" "PickAge" "BlobUpload" "AddAdult" "AddChildren")

for project in "${projectsList[@]}"
do
    dotnet new web -o $project
    cd $project
    echo "FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build 
WORKDIR /src
COPY $project.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build \"$project.csproj\" -c Release -o /app/build

RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT [\"dotnet\", \"$project.dll\"]
" > Dockerfile
    cd ..
done

echo "9 proyectos creados correctamente con Dockerfile"