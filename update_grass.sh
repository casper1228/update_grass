#!/bin/bash

# 定義下載目錄
DOWNLOAD_DIR="/home/lubuntu/Downloads"  # 使用完整路徑
echo "下載目錄: $DOWNLOAD_DIR"

# 找到最新的 .deb 文件
latest_file=$(ls -t "$DOWNLOAD_DIR"/grass_*.deb 2>/dev/null | head -n 1)

# 檢查最新文件是否存在
if [ -f "$latest_file" ]; then
    echo "安裝最新更新: $latest_file"
    sudo dpkg -i "$latest_file"  # 安裝 .deb 文件
    sudo apt-get install -f  # 修復依賴

    # 標記為不升級
    sudo apt-mark hold grass
    echo "已標記 grass 為不升級。"
    echo "更新完成！"
else
    echo "未找到任何 .deb 文件進行安裝。"
fi
