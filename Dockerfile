# 基础镜像
# 优先使用zulu发布，如果存在bug，比如nbt数据缺失等问题，请使用openjdk
FROM azul/zulu-openjdk:21.0.10
# FROM openjdk:21-jdk-slim
# 设置时区 上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone
# 工作目录
WORKDIR /minecraft
# 复制文件
COPY . .

# eula，使用重定向，覆盖写入
RUN echo "eula=true" > /minecraft/eula.txt
# bash脚本权限
RUN chmod +x /minecraft/*.sh

# 运行服务器
ENTRYPOINT ["/minecraft/entrypoint.sh"]
CMD ["/minecraft/startup.sh"]
