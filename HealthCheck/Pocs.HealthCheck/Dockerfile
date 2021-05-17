#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/sdk:3.1
RUN sed -i '/^ssl_conf = ssl_sect$/s/^/#/' /etc/ssl/openssl.cnf
WORKDIR /app
EXPOSE 80


COPY "/" "/app"

# copy Hdiv agent
ARG NEXUS_USERNAME='c_gft_technologies_se'
ARG NEXUS_PASSWORD='Xh4tiUgyK2'
ARG HDIV_AGENT_VERSION='rO0ABXNyAClvcmcuaGRpdi5lZS5saWNlbnNlLnBiLmltcGwuU2lnbmVkTGljZW5zZYqE/59+smqEAgACWwAObGljZW5zZUNvbnRlbnR0AAJbQlsAEHNpZ25hdHVyZUNvbnRlbnRxAH4AAXhwdXIAAltCrPMX+AYIVOACAAB4cAAAApAv1VdmdS/B91gY7WVTj/QIENRaOGAP8frzWmmab/GI52+8/TMVA4WQ6LaoewqKmUg9MDnnjbxM6qvJJwzGOQO0+prPxJemCbeZoMLHopmDQcFbnzuIrfjn7OtsiIW8lZuWSRytnhrDVPWnjwKWlytoVuZYif1fnPZP4d9C+/MFuvOFnrigh3WCAFU+G0jq9UwkyqW2OqZFkN1xiDpzsWjGJ2eka2DCmJIluHNc7z8GzDQc4gsfTSjutJZ/z2V4sdeE5N8Km3sUQTrqV7A7eVjTTF3dDc+csiFCv2yVvaHj14+niEmFAoz6KGzPbOyLw1DW1tvk5chfV8CkojDTewZWIlEbi4VJ56LueQvwyWWUagXeGF5nRWYvS3fFUGL0r5x0bvk9BaaxJFBXROBIMWIaeqgVlEwNKwuJ953KMOSaD1u9Rq3f9haOq5xUvSv6F/aIJKRoSo7bQmnWkUMKC14J6xsB7UlgCon71QvYaowlzvs17aNPzFEy7jxKRVlwzkGkapFQVCCJzVp43+rppmWX26awZF4BJEM6lmBJt3HEq3zMveNhZlfttWocfpmYK8S5h8i6UfytLy+7NVF7wwSULcBcrFU6G+uKeBYdG9Zb4v2ciSlDEnSpWm/jhedXxYtnaLuNG1qCwrwaO/LKatlePfMbfxVo/pjcii5K08ug8AYiKVvm6OdxxbKjEze2GQfpAWGPVfvaXBMoJsjnmFdNqs45ws9rkswuhuPftXP48bosxm7muShZQVnhTnBBTkTW3rWgMP8qFhoyAo4utJFNqzS8nuzOxhjxVzWIN8DGoAwlppmss9b077ZkQTwYo6/LmxFAtM9ZvNGHRWU5x2RFBjxi4Rh7sdIZHI+Yv4KbcHVxAH4AAwAAAQCijEqPiH8rWD2xIEkX+olmw5iGci5XZkENVjqfknDTBYfMQ8md83isoRfiUE5+t1I3KKHBkP4x5XHAgPPjVGMxke7StVNGniFXjAAIusQ7E5ZtKd5J0JVeK1bnk7DwVA0swpuT3QxrJgmWbyu0JQFEIAKCUYeRLVgWjUPcDQdromFfpW8kHjtRSYrvxyumxk4UFMZdomCNiAW6CN/OdArSas9KLxPAsDaUfDgqyjv8wGbmt/TB7kUPm3esY9oTvrE0nBs/YgndYRM9UBSTLWGtgyL0KbIV//+QLjcvkCk2Mgww3V2WRklQkAvkWid/dqiNahdMlMKX4qh1uy/VVLvn'

RUN mkdir -p /opt/hdiv/agent
COPY "hdiv/agent.env" "/opt/hdiv/agent"
COPY "hdiv/env.properties" "/opt/hdiv/agent/"
RUN chmod -R 755 "/opt/hdiv"
RUN chmod -R 755 "/app/hdiv"
RUN dotnet nuget add source https://artifacts.hdivsecurity.com/nexus/service/local/nuget/nuget/ --name nexus --username $NEXUS_USERNAME --password $NEXUS_PASSWORD --store-password-in-clear-text && \
    dotnet add package Hdiv.AST.Profiler --version $HDIV_AGENT_VERSION

ENTRYPOINT ["dotnet", "Pocs.HealthCheck.dll", "--urls", "http://*:80"]