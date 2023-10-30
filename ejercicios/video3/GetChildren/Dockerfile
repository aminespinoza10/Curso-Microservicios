FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env 
WORKDIR /ejercicios/video3/GetChildren
COPY GetChildren.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build GetChildren.csproj -c Release -o /app/build

RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "GetChildren.dll"]

