FROM eclipse-temurin:8-jre
WORKDIR /home/admin
COPY ./bin ./bin
COPY ./conf ./conf
COPY ./plugin ./plugin
COPY ./lib ./lib
COPY ./logs ./logs
ENTRYPOINT ["sh", "-c", "rm -f /home/admin/adapter.pid && sh bin/startup.sh"]

