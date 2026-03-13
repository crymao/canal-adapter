FROM canal/osbase:v3-arm64
WORKDIR /home/admin
COPY ./bin ./bin
COPY ./conf ./conf
COPY ./plugin ./plugin
COPY ./lib ./lib
COPY ./logs ./logs
ENTRYPOINT ["sh", "bin/stop.sh"]
ENTRYPOINT ["sh", "bin/startup.sh"]
