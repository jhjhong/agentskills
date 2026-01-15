# Git Commit Helper

AI 輔助生成標準化的 Git Commit Message，支援多種 AI Coding Assistant。

## 📋 Commit Message 格式

```
<emoji> <type>: <description>
```

### 類型對照表

| Emoji | Type | 說明 |
|-------|------|------|
| ✨ | feat | 新功能 |
| ⬆️ | upd | 套件或版本升級 |
| 🐛 | fix | 修復錯誤 |
| 📝 | docs | 文件更新 |
| 🎨 | style | 程式碼格式調整 |
| ♻️ | refactor | 重構程式碼 |
| 🔥 | rm | 移除程式碼或檔案 |
| ✅ | test | 測試相關 |
| 🔧 | chore | 維護性工作 |

### 範例

```
✨ feat: add user authentication module
🐛 fix: resolve null pointer exception in parser
📝 docs: update API documentation
```

---

## 🚀 部署方式

### 一：Agent Skills（推薦）

將 `SKILL.md` 複製到對應的 skills 目錄：

| AI Agent | 個人層級路徑 |
|----------|-------------|
| Gemini Code Assist (Antigravity) | `~/.gemini/skills/git-commit-helper/` |
| Claude Code | `~/.claude/skills/git-commit-helper/` |

```bash
# Gemini / Antigravity
cp -r git-commit-helper ~/.gemini/skills/

# Claude
cp -r git-commit-helper ~/.claude/skills/
```

---

### 二：IDE 設定檔（Source Control Generate 按鈕）

讓 **VSCode / Cursor / Antigravity** 側邊欄的 **Generate** 按鈕也遵循此格式：

#### Gemini Code Assist / Antigravity

編輯 `~/.gemini/GEMINI.md`，加入以下內容：

```markdown
## Git Commit Message Format

When generating git commit messages, follow these rules:

1. **Language**: Use English only
2. **Format**: `<emoji> <type>: <description>`
3. **Style**: Keep it concise and descriptive

### Type Prefixes (MUST include emoji):

| Emoji | Type | When to Use |
|-------|------|-------------|
| ✨ | feat | New feature |
| ⬆️ | upd | Package or version upgrade |
| 🐛 | fix | Bug fix |
| 📝 | docs | Documentation update |
| 🎨 | style | Code formatting |
| ♻️ | refactor | Code refactoring |
| 🔥 | rm | Remove code or files |
| ✅ | test | Testing related |
| 🔧 | chore | Maintenance work |

### Examples:
- `✨ feat: add user authentication module`
- `🐛 fix: resolve null pointer exception in parser`
- `📝 docs: update API documentation`
```

#### Claude Code

編輯 `~/.claude/CLAUDE.md`，加入相同內容。

#### Cursor

編輯專案根目錄的 `.cursorrules` 或 `~/.cursor/rules`，加入相同內容。

---

## ✅ 驗證

設定完成後：

1. **對話模式**：說「commit」或「幫我提交」，AI 會自動分析 `git diff --staged` 並生成格式化的 commit message

2. **側邊欄 Generate**：在 Source Control 面板點擊 **Generate** 按鈕，應生成符合規範的英文 + emoji commit message

> **提示**：可能需要重新載入編輯器視窗讓設定生效
