FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src
COPY GetChildren.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build "GetChildren.csproj" -c Release -o /app/build

RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "GetChildren.dll"]

