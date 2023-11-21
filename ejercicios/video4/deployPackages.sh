#!/bin/bash

# Crea los nueve proyectos para cada uno de los servicios
projectsList=("GetAdults" "GetChildren" "GetAdultById" "GetChildById" "AddMember" "PickAge" "BlobUpload" "AddAdult" "AddChildren")

for project in "${projectsList[@]}"
do
    case $project in 
        "GetAdults")
            cd "GetAdults"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Swashbuckle.AspNetCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.AspNetCore.OpenApi
            cd ..
            ;;
        "GetChildren")
            cd "GetChildren"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Swashbuckle.AspNetCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.AspNetCore.OpenApi
            cd ..
            ;;
        "GetAdultById")
            cd "GetAdultById"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Swashbuckle.AspNetCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.AspNetCore.OpenApi
            cd ..
            ;;
        "GetChildById")
            cd "GetChildById"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Swashbuckle.AspNetCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.AspNetCore.OpenApi
            cd ..
            ;;
        "AddMember")
            cd "AddMember"
                dotnet add package Swashbuckle.AspNetCore
                dotnet add package Microsoft.AspNetCore.OpenApi
                dotnet adp package Microsoft.Azure.ServiceBus
            cd ..
            ;;
        "PickAge")
            cd "PickAge"
                rm -v /*
                cat .env.example > .env
                cat AgeSelector.py > AgeSelector.py
                cat Dockerfile > Dockerfile
                cat requirements.txt > requirements.txt
            cd ..
            ;;
        "BlobUpload")
            cd "BlobUpload"
            dotnet add package Azure.Storage.Blobs
            cd ..
            ;;
        "AddAdult")
            rmdir "AddAdult"
            dotnet new console -o AddAdult
            cd AddAdult
            dotnet add package Azure.Messaging.ServiceBus
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.Extensions.Configuration
            dotnet add package Microsoft.Extensions.Configuration.FileExtensions
            dotnet add package Microsoft.Extensions.Configuration.Json
            dotnet add package System.Data.SqlClient
            cat Dockerfile > Dockerfile
            cd ..
            ;;
        "AddChildren")
            rmdir "AddChildren"
            dotnet new console -o AddChildren
            cd AddChildren
            dotnet add package Azure.Messaging.ServiceBus
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            dotnet add package Microsoft.Extensions.Configuration
            dotnet add package Microsoft.Extensions.Configuration.FileExtensions
            dotnet add package Microsoft.Extensions.Configuration.Json
            dotnet add package System.Data.SqlClient
            cat Dockerfile > Dockerfile
            cd ..
            ;;
    esac
done

echo "9 proyectos creados correctamente con Dockerfile"