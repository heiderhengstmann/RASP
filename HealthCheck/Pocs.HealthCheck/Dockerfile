#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/sdk:3.1
RUN sed -i '/^ssl_conf = ssl_sect$/s/^/#/' /etc/ssl/openssl.cnf
WORKDIR /app
EXPOSE 80


COPY "/" "/app"

# copy Hdiv agent
ARG NEXUS_USERNAME 
ARG NEXUS_PASSWORD
ARG HDIV_AGENT_VERSION

RUN mkdir -p /opt/hdiv/agent
COPY "hdiv/agent.env" "/opt/hdiv/agent"
COPY "hdiv/env.properties" "/opt/hdiv/agent/"
RUN chmod -R 755 "/opt/hdiv"
RUN chmod -R 755 "/app/hdiv"
RUN dotnet nuget add source https://artifacts.hdivsecurity.com/nexus/service/local/nuget/nuget/ --name nexus --username $NEXUS_USERNAME --password $NEXUS_PASSWORD --store-password-in-clear-text && \
    dotnet add package Hdiv.AST.Profiler --version $HDIV_AGENT_VERSION

ENTRYPOINT ["dotnet", "Pocs.HealthCheck.dll", "--urls", "http://*:80"]