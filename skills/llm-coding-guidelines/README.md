# LLM Coding Guidelines

減少常見大型語言模型（LLM）編碼錯誤的行為準則，引導 AI Agent 在撰寫程式碼時保持謹慎，遵守現有結構並保持目標導向。請視需求與專案特定的指引合併使用。

## 📋 核心準則

這個 Skill 指導 AI 遵循以下四大原則：

1. **編碼前深思熟慮**：不隨意假設。指出權衡取捨，必要時主動提出更簡單的方法或進行詢問。
2. **簡單至上**：寫出能解決問題的最少程式碼。防範推測性的設計、過度抽象化與不需要的彈性功能。
3. **精確的修改**：只更動絕對必要的部分。配合現有風格，不隨意重新排版或重構沒有損壞的程式碼。
4. **目標導向執行**：定義明確的驗證步驟和成功標準。每一步修改皆以通過測試為優先。

---

## 🚀 部署方式

### 方法一：Agent Skills（推薦）

執行 repo 根目錄的 `deploy.sh` 即可自動部署。

```bash
cd ../..
./deploy.sh
```

若需手動部署：

```bash
# Gemini / Antigravity
ln -s "$(pwd)" ~/.gemini/skills/llm-coding-guidelines
# 或
cp -r . ~/.gemini/skills/llm-coding-guidelines/

# Claude Code
ln -s "$(pwd)" ~/.claude/skills/llm-coding-guidelines
# 或
cp -r . ~/.claude/skills/llm-coding-guidelines/

# Cursor
ln -s "$(pwd)" ~/.cursor/skills/llm-coding-guidelines
# 或
cp -r . ~/.cursor/skills/llm-coding-guidelines/
```

---

### 方法二：專案與全域設定檔 (IDE / Project Rules)

若僅希望在特定專案套用此準則，亦可將 `SKILL.md` 的內容加入您的專案工具設定檔中，讓 AI 預設讀取這些編碼準則：

#### Gemini / Antigravity
編輯專案根目錄的 `GEMINI.md` 或全域的 `~/.gemini/GEMINI.md`，貼上此準則內容。

#### Claude Code
編輯專案根目錄的 `CLAUDE.md` 或全域的 `~/.claude/CLAUDE.md`，貼上此準則內容。

#### Cursor
編輯專案根目錄的 `.cursorrules` 或全域的 `~/.cursor/rules`，貼上此準則內容。

---
