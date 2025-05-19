#!/bin/bash

#!/bin/bash

set -e

# 默认值
CORE_URL="${CORE_URL:-}"
MIN_RAM="${MIN_RAM:-1G}"
MAX_RAM="${MAX_RAM:-2G}"
JAR_NAME="server.jar"
JVM_ARGS_FILE="jvm.args"

# 下载 server.jar（如果不存在）
if [ ! -f "$JAR_NAME" ]; then
    if [ -n "$CORE_URL" ]; then
        echo "Downloading Minecraft core from $CORE_URL..."
        curl -o "$JAR_NAME" -L "$CORE_URL"
    else
        echo "Error: server.jar not found and CORE_URL is not provided."
        exit 1
    fi
else
    echo "$JAR_NAME already exists, skipping download."
fi

# 写入 JVM 参数文件
echo "-Xms$MIN_RAM" > "$JVM_ARGS_FILE"
echo "-Xmx$MAX_RAM" >> "$JVM_ARGS_FILE"
if [ -n "$OTHER_ARGS" ]; then
    echo "$OTHER_ARGS" >> "$JVM_ARGS_FILE"
fi

# 启动 Minecraft 服务端
echo "Starting Minecraft server..."
exec java $(cat $JVM_ARGS_FILE) -jar "$JAR_NAME" --nogui