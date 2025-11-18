#!/bin/bash
cleanup() {
    echo "Caught SIGTERM, stop minecraft server"
    echo "stop" >> /tmp/input # 使用重定向模拟正确停止客户端
}
trap cleanup SIGTERM

echo "Run script: $@"
"$@" &         # 启动子进程
child=$!       # 记录子进程 PID
wait "$child"  # Bash 等待子进程退出
