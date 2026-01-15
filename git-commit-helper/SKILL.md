---
name: Git Commit Helper
description: AI-assisted git commit message generation with standardized format
---

# Git Commit Helper

當用戶要求生成 git commit message 時，遵循以下規範：

## 基本原則

1. **語言**：以英文為主要語言
2. **風格**：簡潔明瞭，直接描述變更內容
3. **格式**：`<emoji> <type>: <description>`

## 類型分類

根據變更類型，在訊息開頭使用對應的 emoji 和類型標籤：

| Emoji | Type | 用途 |
|-------|------|------|
| ✨ | feat | 新功能 (New Feature) |
| ⬆️ | upd | 套件或版本升級 (Update) |
| 🐛 | fix | 修復錯誤 (Bug Fix) |
| 📝 | docs | 文件更新 (Documentation) |
| 🎨 | style | 程式碼格式調整 (Code Formatting) |
| ♻️ | refactor | 重構程式碼 (Code Refactoring) |
| 🔥 | rm | 移除程式碼或檔案 (Remove) |
| ✅ | test | 測試相關 (Testing) |
| 🔧 | chore | 維護性工作 (Maintenance) |

## 範例

```
✨ feat: add user authentication module
⬆️ upd: upgrade numpy to 1.24.0
🐛 fix: resolve null pointer exception in data parser
📝 docs: update API documentation for auth endpoints
🎨 style: format code with black
♻️ refactor: extract validation logic to separate class
🔥 rm: remove deprecated helper functions
✅ test: add unit tests for payment service
🔧 chore: update CI/CD configuration
```

## 觸發條件

當用戶說出以下關鍵字時，**自動觸發**此 skill：
- "commit"
- "提交"
- "git commit"
- "幫我寫 commit"
- "生成 commit message"

## 自動執行流程

**每次觸發時，必須自動執行以下步驟，無需詢問用戶：**

### Step 1: 自動查看變更
```bash
git diff --staged --stat
git diff --staged
```

### Step 2: 分析變更內容
- 檢視修改的檔案類型與數量
- 理解變更的目的與範圍

### Step 3: 判斷類型
根據變更內容選擇最適合的類型分類（feat/fix/docs 等）

### Step 4: 生成 Commit Message
組合 emoji + type + 簡潔英文描述

### Step 5: 提供完整指令
```bash
git commit -m "<generated message>"
```

## 重要提醒

- **不要詢問用戶變更了什麼**，直接執行 `git diff --staged` 自動分析
- 如果沒有 staged 的變更，提示用戶先 `git add` 檔案
