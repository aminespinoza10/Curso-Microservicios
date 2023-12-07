#!/bin/bash

cd ../../infrastructure

#Deploy Terraform infrastructure
terraform init

echo "\n***[1/3]Terraform has already initialized"

terraform plan -var-file=terraform.tfvars -out=plan.out

echo "\n***[2/3]Terraform has already planned"

terraform apply "plan.out"

echo "\n***[3/3]Terraform has already applied the resources"

echo -e "\n*** Gathering required outputs"

terraform output -json | jq "[. | to_entries | .[] | {key:.key, value: .value.value}] | from_entries" > "output.json"

echo -e "\n*** The outputs have been saved in output.json"

RESOURCE_GROUP=$(jq -r '.resource_group_name' output.json)
SERVER_NAME=$(jq -r '.sql_server_name' output.json)
DATABASE_NAME=$(jq -r '.sql_database_name' output.json)
SERVER_USERNAME=$(jq -r '.admin_username' output.json)
SERVER_PASSWORD=$(jq -r '.admin_password' output.json)
SERVICEBUS_ENDPOINT=$(jq -r '.servicebus_endpoint' output.json)
STORAGE_CONNECTION_STRING=$(jq -r '.storage_connection_string' output.json)
ACR_NAME=$(jq -r '.acr_name' output.json)
SQL_CONNECTION_STRING="Server=tcp:${SERVER_NAME}.database.windows.net,1433;Initial Catalog=${DATABASE_NAME};Persist Security Info=False;User ID=${SERVER_USERNAME};Password=${SERVER_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

echo -e "\n*** The resource group name is: $RESOURCE_GROUP"

#Create SQL tables
sqlcmd -S tcp:${SERVER_NAME}.database.windows.net -d ${DATABASE_NAME} -U ${SERVER_USERNAME} -P ${SERVER_PASSWORD} -Q "CREATE TABLE Adults (Id INT IDENTITY(1,1), Name NVARCHAR(30), Lastname NVARCHAR(50), Birthyear INT, ImageUrl NVARCHAR(80))"

sqlcmd -S tcp:${SERVER_NAME}.database.windows.net -d ${DATABASE_NAME} -U ${SERVER_USERNAME} -P ${SERVER_PASSWORD} -Q "CREATE TABLE Children (Id INT IDENTITY(1,1), Name NVARCHAR(30), Lastname NVARCHAR(50), Birthyear INT, ImageUrl NVARCHAR(80))"

echo -e "\n*** SQL tables have been created"

#Create appsettings and env files with required values
cd ../ejercicios/video8

ls -l

echo -e "\n*** Creating appsettings and .env files"

# Create appsettings for AddAdult
cat << EOF > "./AddAdult/appsettings.json"
{
  "ServiceBus": {
    "NamespaceEndpoint": "$SERVICEBUS_ENDPOINT",
    "TopicName": "adultstopic"
  },
  "ConnectionStrings": {
      "DefaultConnection": "$SQL_CONNECTION_STRING"
  }
}
EOF
echo "CREATED: appsettings.json file for AddAdult"

# Create appsettings for AddChildren
cat << EOF > "./AddChildren/appsettings.json"
{
  "ServiceBus": {
    "NamespaceEndpoint": "$SERVICEBUS_ENDPOINT",
    "TopicName": "childrentopic"
  },
  "ConnectionStrings": {
      "DefaultConnection": "$SQL_CONNECTION_STRING"
  }
}
EOF
echo "CREATED: appsettings.json file for AddChildren"

# Create appsettings for AddMember
cat << EOF > "./AddMember/appsettings.json"
{
  "ServiceBus": {
    "AzureServiceBusConnectionString": "$SERVICEBUS_ENDPOINT",
    "QueueName": "pickAge "
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for AddMember"

# Create appsettings for BlobUpload
cat << EOF > "./BlobUpload/appsettings.json"
{
  "Blob": {
    "ConnectionString": "$STORAGE_CONNECTION_STRING",
    "ContainerName": "userimages"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for BlobUpload"

# Create appsettings for GetAdultById
cat << EOF > "./GetAdultById/appsettings.json"
{
  "ConnectionStrings": {
    "DefaultConnection": "$SQL_CONNECTION_STRING"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for GetAdultById"

# Create appsettings for GetAdults
cat << EOF > "./GetAdults/appsettings.json"
{
  "ConnectionStrings": {
    "DefaultConnection": "$SQL_CONNECTION_STRING"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for GetAdults"

# Create appsettings for GetChildById
cat << EOF > "./GetChildById/appsettings.json"
{
  "ConnectionStrings": {
    "DefaultConnection": "$SQL_CONNECTION_STRING"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for GetChildById"

# Create appsettings for GetChildren
cat << EOF > "./GetChildren/appsettings.json"
{
  "ConnectionStrings": {
    "DefaultConnection": "$SQL_CONNECTION_STRING"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
EOF
echo "CREATED: appsettings.json file for GetChildren"

# Create .env file for PickAge
cat << EOF > "./PickAge/.env"
SERVICE_BUS_CONN_STR='$SERVICEBUS_ENDPOINT'
SERVICE_BUS_QUEUE_NAME='pickage'
SERVICE_BUS_ADULTS_TOPIC_NAME='adultstopic'
SERVICE_BUS_CHILDREN_TOPIC_NAME='childrentopic'
EOF
echo "CREATED: env file for PickAge"

echo -e "\n*** Files have been created"

#Build and publish projects
echo -e "\n*** Get access to container registry"
az acr login --name $ACR_NAME

IMAGE_BASE_NAME="${ACR_NAME}.azurecr.io"

SERVICES_LIST=("AddAdult" "AddChildren" "AddMember" "BlobUpload" "GetAdultById" "GetAdults" "GetChildById" "GetChildren" "PickAge")
for service in "${SERVICES_LIST[@]}"
do
    echo
    echo "----------------------------------------"
    echo -e "\n*** Building and publishing $service\n**"
    echo "----------------------------------------"
    cd $service
    service_lowercase=${service,,}
    docker build --progress plain -t ${IMAGE_BASE_NAME}/${service_lowercase}:latest .
    docker push ${IMAGE_BASE_NAME}/${service_lowercase}:latest
    cd ..
done

az acr repository list --name ${ACR_NAME}

#Deploy images to Azure Container Apps
echo -e "\n*** Deploying images to Azure Container Apps"

az containerapp env create -n "microservices-env" -g $RESOURCE_GROUP --location "eastus2"

az containerapp up --name "addadult" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/addadult:latest

az containerapp up --name "addchildren" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/addchildren:latest

az containerapp up --name "addmember" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/addmember:latest --ingress external --target-port 80

az containerapp up --name "blobupload" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/blobupload:latest --ingress external --target-port 80

az containerapp up --name "getadultbyid" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/getadultbyid:latest --ingress external --target-port 80

az containerapp up --name "getadults" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/getadults:latest --ingress external --target-port 80

az containerapp up --name "getchildbyid" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/getchildbyid:latest --ingress external --target-port 80

az containerapp up --name "getchildren" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/getchildren:latest --ingress external --target-port 80

az containerapp up --name "pickage" --resource-group $RESOURCE_GROUP --environment microservices-env --image $IMAGE_BASE_NAME/pickage:latest

echo -e "\n*** Images deployed to Azure Container Apps"

echo -e "\n*** Rock 'n roll baby!"