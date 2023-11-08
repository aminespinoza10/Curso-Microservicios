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
            cd ..
            ;;
        "BlobUpload")
            cd "BlobUpload"
            dotnet add package Azure.Storage.Blobs
            cd ..
            ;;
        "AddAdult")
            cd "AddAdult"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            cd ..
            ;;
        "AddChildren")
            cd "AddChildren"
            dotnet add package Microsoft.EntityFrameworkCore
            dotnet add package Microsoft.EntityFrameworkCore.SqlServer
            cd ..
            ;;
    esac
done

echo "9 proyectos creados correctamente con Dockerfile"