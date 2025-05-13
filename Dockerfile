# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="1.2.4"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Plexiglass Mountain"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/53/533c68e6aa7d58f7afe8697cc5e14850450d5b366dbb2ede1ee2d89ac48fd439.png"
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