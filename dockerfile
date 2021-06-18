FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# Restore
COPY NuGet.config .

COPY src/. ./src

RUN dotnet restore src/UmbracoDockerTemplate.sln

# Build app
WORKDIR /source/src
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "Web.Umbraco.dll"]

# Copy the wait-for-it.sh script as an mssql prerequisite
COPY ./wait-for-it.sh ./wait-for-it.sh
RUN chmod +x ./wait-for-it.sh