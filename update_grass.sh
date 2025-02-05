#!/bin/bash

# 定義下載目錄
DOWNLOAD_DIR="/home/lubuntu/Downloads"

# 找到最新的 .deb 文件
latest_file=$(ls -t "$DOWNLOAD_DIR"/Grass_*.deb 2>/dev/null | head -n 1)

# 輸出找到的文件
echo "找到的最新文件: $latest_file"

# 檢查最新文件是否存在
if [ -f "$latest_file" ]; then
    # 關閉正在運行的 Grass
    echo "正在關閉正在運行的 Grass..."
    pkill grass  # 終止 Grass 進程

    echo "安裝最新更新: $latest_file"
    sudo dpkg -i "$latest_file"  # 安裝 .deb 文件
    sudo apt-get install -f  # 修復依賴

    # 標記為不升級
    sudo apt-mark hold grass
    echo "已標記 grass 為不升級。"

    # 重新啟動 Grass
    echo "正在重新啟動 Grass..."
    grass &  # 以背景模式啟動 Grass
    echo "更新完成！"
else
    echo "未找到任何 .deb 文件進行安裝。"
fi
