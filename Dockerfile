# Get Image
FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build-env


# Restore
COPY api/api.csproj /api/
RUN dotnet restore /api/api.csproj
COPY NUnitTestProject1/NUnitTestProject1.csproj /NUnitTestProject1/
RUN dotnet restore /NUnitTestProject1/NUnitTestProject1.csproj

# Copy
COPY . .

# Test
RUN dotnet test /NUnitTestProject1/NUnitTestProject1.csproj

# Publish
RUN dotnet publish /api/api.csproj -c Release -o /app/

# Run
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1
WORKDIR /development
COPY --from=build-env /app/ .
ENTRYPOINT dotnet api.dll
