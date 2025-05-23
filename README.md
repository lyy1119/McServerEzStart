# McServerEzSatrt
基于docker的一键快速开服

## 使用方法

### 1.编辑`docker-compose.yml`

该项目将Minecraft开服的基本参数放在`docker-compose.yml`中进行配置，在开服之前，你需要修改`docker-compose.yml`以调整相关配置。  

**docker-compose.yml**
```yml
agrs:
  - JAVA_VERSION=21 # 指定java版本 必要 这里指定了使用哪个版本的Java，一般来说，1.18以下可以使用17，1.18以上使用21
environment:
    - CORE_URL=https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar  # 核心下载直链，当docker启动时，会自动下载服务器核心，避免了配置繁琐。你需要确保填入的连接能下载相关文件。这里使用paper的1.18.2的服务器核心为例
    - MIN_RAM=1G # 最小内存
    - MAX_RAM=1G # 最大内存
    - OTHER_ARGS= ... # 其他启动参数，gc等相关Java启动参数，如不需要则注释
```

其他配置还有：`volumes:`用于映射文件，方便复制、修改存档等；`ports:`映射端口到宿主机。这些根据你的具体需求配置

### 2.启动

```bash
docker-compose up -d
```
