# 文件作用：停止并清理 TDengine Docker 容器。
# 作者：DAMU
# 创建时间：2026-08-25
$ErrorActionPreference = 'Stop'

$containerName = 'tdengine'
Write-Host "停止 TDengine 容器..."
docker stop $containerName 2>$null
Write-Host "删除 TDengine 容器..."
docker rm $containerName 2>$null
Write-Host "TDengine 容器已清理（数据保留在 D:\TDengine\data）"
