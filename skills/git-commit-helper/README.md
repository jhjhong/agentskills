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

### 方法一：Agent Skills（推薦）

執行 repo 根目錄的 `deploy.sh` 即可自動部署。

```bash
cd ../..
./deploy.sh
```

若需手動部署：

```bash
# Gemini / Antigravity
ln -s "$(pwd)" ~/.gemini/skills/git-commit-helper
# or
cp -r . ~/.gemini/skills/git-commit-helper/

# Claude Code
ln -s "$(pwd)" ~/.claude/skills/git-commit-helper
# or
cp -r . ~/.claude/skills/git-commit-helper/
```

---

### 方法二：IDE 設定檔（Source Control Generate 按鈕）

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
