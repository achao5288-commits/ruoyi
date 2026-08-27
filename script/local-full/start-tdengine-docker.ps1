# 文件作用：通过 Docker 启动 TDengine OSS Server，用于 IoT 模块本地开发。
# 作者：DAMU
# 创建时间：2026-08-25
# 核心功能：拉取 tdengine/tdengine 镜像，启动容器并持久化数据到 D 盘。
# 前置条件：Docker Desktop 已安装并运行。
$ErrorActionPreference = 'Stop'

$image = 'tdengine/tdengine:latest'
$containerName = 'tdengine'
$dataDir = 'D:\TDengine\data'
$logDir = 'D:\TDengine\log'

New-Item -ItemType Directory -Force $dataDir, $logDir | Out-Null

Write-Host "拉取 TDengine 镜像: $image"
docker pull $image
if ($LASTEXITCODE -ne 0) {
    throw "拉取 TDengine 镜像失败，请确认 Docker Desktop 已启动。"
}

$existing = docker ps -a --filter "name=^/$containerName$" --format '{{.ID}}'
if ($existing) {
    Write-Host "容器 $containerName 已存在，先停止并删除..."
    docker rm -f $containerName | Out-Null
}

Write-Host "启动 TDengine 容器..."
docker run -d `
    --name $containerName `
    --hostname tdengine-server `
    -e TZ=Asia/Shanghai `
    -v "${dataDir}:/var/lib/taos" `
    -v "${logDir}:/var/log/taos" `
    -p 6030:6030 `
    -p 6041:6041 `
    -p 6043:6043 `
    -p 6044-6049:6044-6049 `
    -p 6044-6045:6044-6045/udp `
    -p 6060:6060 `
    $image

if ($LASTEXITCODE -ne 0) {
    throw "启动 TDengine 容器失败。"
}

Write-Host "等待 TDengine 启动..."
Start-Sleep -Seconds 5

Write-Host "创建数据库 ruoyi_vue_pro..."
docker exec $containerName taos -s "CREATE DATABASE IF NOT EXISTS ruoyi_vue_pro;"
if ($LASTEXITCODE -ne 0) {
    throw "创建数据库失败，请检查 TDengine 容器日志。"
}

Write-Host "验证 TDengine 连接..."
docker exec $containerName taos -s "SHOW DATABASES;"
Write-Host ""
Write-Host "TDengine 已启动:"
Write-Host "  容器名: $containerName"
Write-Host "  数据目录: $dataDir"
Write-Host "  日志目录: $logDir"
Write-Host "  JDBC-WS 连接: jdbc:TAOS-WS://127.0.0.1:6041/ruoyi_vue_pro"
Write-Host "  REST 连接: http://127.0.0.1:6041"
Write-Host "  账号: root / taosdata"
