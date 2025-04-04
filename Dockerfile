# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="1.2.4"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Plexiglass Mountain"
LABEL homepage.icon="https://apps.modpacks.ch/modpacks/art/91/plexiglass-splash-discord.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://PlexiglassMountain:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Plexiglass Mountain v1.2.4 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]