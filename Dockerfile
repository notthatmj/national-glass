# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:6.0 as build-env
WORKDIR /ng-solution
COPY NationalGlass.sln ./
COPY NationalGlass/*.csproj ./NationalGlass/
COPY NationalGlassTests/*.csproj ./NationalGlassTests/
RUN dotnet restore
COPY . .
RUN dotnet test
WORKDIR NationalGlass
RUN dotnet publish -c Release -o /publish
FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /NationalGlass
COPY --from=build-env /publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "NationalGlass.dll"]
