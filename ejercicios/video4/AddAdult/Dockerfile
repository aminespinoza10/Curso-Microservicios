FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env 
WORKDIR /ejercicios/video3/AddAdult
COPY AddAdult.csproj .
RUN dotnet restore
COPY . .

RUN dotnet build AddAdult.csproj -c Release -o /app/build

RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "AddAdult.dll"]

