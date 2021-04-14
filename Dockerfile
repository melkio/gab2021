FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["src/Gab2021.Web/Gab2021.Web.csproj", "src/Gab2021.Web/"]
RUN dotnet restore "src/Gab2021.Web/Gab2021.Web.csproj"
COPY . .
WORKDIR "/src/src/Gab2021.Web"
RUN dotnet build "Gab2021.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Gab2021.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Gab2021.Web.dll"]
