# 基础镜像
FROM openjdk:21-jdk-slim
# 设置时区 上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone
# 工作目录
WORKDIR /minecraft
# 复制文件
COPY ./startup.sh /minecraft/startup.sh
RUN chmod +x /minecraft/startup.sh

# 安装vim方便修改
RUN apt-get update && \
    apt-get install -y --no-install-recommends vim && \
    apt-get install -y --no-install-recommends curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# eula
RUN echo "eula=true" >> /minecraft/eula.txt
# 运行命令
CMD ["/minecraft/startup.sh"]
