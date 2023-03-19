# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:6.0 as build-env
WORKDIR NationalGlass
COPY NationalGlass/*.csproj .
RUN dotnet restore
COPY NationalGlass .
RUN dotnet test
RUN dotnet publish -c Release -o /publish
FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
COPY --from=build-env /publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "NationalGlass.dll"]
