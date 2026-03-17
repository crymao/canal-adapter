FROM eclipse-temurin:8-jre

USER root
RUN apt-get update && apt-get install -y file && rm -rf /var/lib/apt/lists/*

WORKDIR /home/admin

# 镜像中保留一份“原始配置”，避免被 volume 覆盖后丢失
COPY ./conf ./conf-origin
COPY ./bin ./bin
COPY ./plugin ./plugin
COPY ./lib ./lib
COPY ./logs ./logs

# 启动前：如果 /home/admin/conf 不存在或为空，则把 conf-origin 拷贝过去，然后启动
ENTRYPOINT ["sh", "-c", "\
  if [ ! -d /home/admin/conf ] || [ -z \"$(ls -A /home/admin/conf 2>/dev/null)\" ]; then \
    mkdir -p /home/admin/conf && cp -a /home/admin/conf-origin/* /home/admin/conf/; \
  fi; \
  rm -f /home/admin/bin/adapter.pid; \
  sh bin/startup.sh \
"]
