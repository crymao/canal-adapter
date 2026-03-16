FROM eclipse-temurin:8-jre

USER root
RUN apt-get update && apt-get install -y file && rm -rf /var/lib/apt/lists/*

WORKDIR /home/admin
COPY ./bin ./bin
COPY ./conf ./conf
COPY ./plugin ./plugin
COPY ./lib ./lib
COPY ./logs ./logs

ENTRYPOINT ["sh", "-c", "rm -f /home/admin/bin/adapter.pid && sh bin/startup.sh"]
