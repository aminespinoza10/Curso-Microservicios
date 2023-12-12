FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src
COPY BlobUpload.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build "BlobUpload.csproj" -c Release -o /app/build

RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "BlobUpload.dll"]

