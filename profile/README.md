# KuroHelper

串接各平台的 Galgame 助手

## 關於我們

KuroHelper 是一個專注於視覺小說（Galgame）領域的開源專案組織，致力於整合多個資料平台，為台灣使用者提供完整的 galgame 資料查詢統整。

## 核心價值

- **模組化設計**：採用微服務架構，各模組職責清晰，便於獨立開發與維護
- **資料整合**：串接多個主流資料平台，提供統一的資料存取介面
- **開源協作**：歡迎社群參與，共同推動專案發展
- **技術創新**：持續優化架構設計，追求高效能與可擴展性

## 專案架構

### 🤖 [discordbot](https://github.com/kuro-helper/discordbot)

Discord 機器人應用，提供互動式查詢與管理功能，讓使用者能透過熟悉的平台快速取得所需資訊。

### ⚙️ [core](https://github.com/kuro-helper/core)

底層核心模組，封裝業務邏輯與通用功能，為上層應用提供穩定的基礎服務。

### 🗄️ [db](https://github.com/kuro-helper/db)

核心資料庫模組，提供統一的資料存取層。

### 🌐 [api](https://github.com/kuro-helper/api)(開發中)

RESTful API 服務，對外提供標準化的資料查詢與操作介面，支援多種應用場景整合。

### 🔌 [proxy](https://github.com/kuro-helper/proxy)

代理服務模組，提供網路代理與連線管理功能，確保系統穩定運行。

## 貢獻指南

我們歡迎所有形式的貢獻，無論是程式碼改進、文件完善、問題回報或功能建議。  
本組織因為開發人員較少，在更新上會比較緩慢。

## 授權

詳見各專案的 LICENSE 檔案。

---
