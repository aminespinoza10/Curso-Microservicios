FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src
COPY AddChildren.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build "AddChildren.csproj" -c Release -o /app/build

RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/sdk:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "AddChildren.dll"]