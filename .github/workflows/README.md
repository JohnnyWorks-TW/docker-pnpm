# Docker Build GitHub Action 設定指南

## 概述

此項目包含一個 GitHub Action 工作流，用於自動建構和推送 Docker image 到 Docker Hub。

## 設定步驟

### 1. 設定 Docker Hub 密鑰

在您的 GitHub 倉庫中設定以下 Secrets：

1. 進入 GitHub 倉庫 → Settings → Secrets and variables → Actions
2. 添加以下 Repository secrets：
   - `DOCKER_USERNAME`: 您的 Docker Hub 使用者名
   - `DOCKER_PASSWORD`: 您的 Docker Hub 的 AccessToken (推薦) 或密碼

### 2. 獲取 Docker Hub 訪問令牌

1. 登錄 [Docker Hub](https://hub.docker.com/)
2. 點擊右上角使用者名 → Account Settings
3. 選擇 Security → New Access Token
4. 創建新的 AccessToken 並複製保存

## 工作流觸發條件

該 GitHub Action 會在以下情況下自動觸發：

- **Push 到主分支**: 當代碼推送到 `main` 或 `master` 分支時
- **創建標籤**: 當創建以 `v` 開頭的標籤時 (如 `v1.0.0`)
- **Pull Request**: 針對主分支的 PR (僅建構，不推送)
- **手動觸發**: 在 Actions 頁面手動運行

## 建構的鏡像標籤

根據觸發條件，會生成不同的標籤：

- `johnnyworks/pnpm:latest` - 主分支的最新建構
- `johnnyworks/pnpm:22.17.0-slim` - 主分支的版本標籤
- `johnnyworks/pnpm:v1.0.0` - 基於 Git 標籤的版本
- `johnnyworks/pnpm:main` - 分支名標籤

## 支援的平台

Docker image 會建構為多架構鏡像，支持：

- linux/amd64
- linux/arm64
- linux/arm/v7

## 手動運行

1. 進入 GitHub 倉庫的 Actions 頁面
2. 選擇 "Docker Build and Push" 工作流
3. 點擊 "Run workflow" 按鈕
4. 選擇分支並運行

## 本地測試

如果需要在本地測試 Docker 建構：

```bash
# 建構鏡像
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t johnnyworks/pnpm:test .

# 單平台建構(更快)
docker build -t johnnyworks/pnpm:test .
```

## 故障排除

### 常見問題

1. **推送失敗**: 檢查 Docker Hub 密鑰是否正確設定
2. **權限錯誤**: 確保 Docker Hub AccessToken 有推送權限
3. **多架構建構失敗**: 可能是特定架構不支持某些套件

### 查看建構日誌

1. 進入 GitHub 倉庫的 Actions 頁面
2. 點擊失敗的工作流運行
3. 展開相關步驟查看詳細 Log
