# My Agent Skills

個人自訂的 AI Agent Skills 集合，可用於擴展各種 AI Coding Assistant 的功能。

## 🤖 支援的 AI Agents

| AI Agent | Skills 路徑 |
|----------|-------------|
| **Gemini Code Assist** | `~/.gemini/skills/` 或 `.gemini/skills/` |
| **Claude Code** | `~/.claude/skills/` 或 `.claude/skills/` |

## 📁 Skills 列表

| Skill | 說明 |
|-------|------|
| [git-commit-helper](./git-commit-helper/SKILL.md) | AI 輔助生成標準化 Git Commit Message |

## 🚀 部署方式

### 個人層級（推薦）

將 skills 複製到對應 Agent 的 skills 目錄，所有專案都能使用：

```bash
# Gemini Code Assist
cp -r git-commit-helper ~/.gemini/skills/

# Claude Code
cp -r git-commit-helper ~/.claude/skills/
```

### 專案層級

將 skills 放到專案的 `.gemini/skills/` 或 `.claude/skills/` 目錄，僅該專案可用（團隊成員也能共享）：

```bash
# Gemini - 在專案根目錄執行
mkdir -p .gemini/skills
cp -r /path/to/git-commit-helper .gemini/skills/

# Claude - 在專案根目錄執行
mkdir -p .claude/skills
cp -r /path/to/git-commit-helper .claude/skills/
```

### 一鍵部署腳本

```bash
# 部署所有 skills 到所有支援的 Agents
./deploy.sh
```

> **注意**：當個人層級與專案層級有同名 Skill 時，**個人層級優先**。

## 📝 Skill 結構

每個 Skill 遵循 [Agent Skills 規格](https://agentskills.io/specification)：

```
skill-name/
├── SKILL.md        # 必要：包含 YAML frontmatter 與指令
├── scripts/        # 可選：可執行腳本 (Python, Bash, etc.)
├── references/     # 可選：參考文件
└── assets/         # 可選：靜態資源
```

### SKILL.md 格式

```yaml
---
name: skill-name          # 必須與資料夾名稱一致
description: 描述此 skill 的用途與觸發時機
---

# Skill 標題

詳細的使用說明與步驟...
```

### 命名規則

- 長度：1-64 字元
- 只能使用：小寫字母、數字、`-`
- 不能以 `-` 開頭或結尾
- 不能有連續的 `-`
- **必須與目錄名稱一致**

## 🛠️ 建立新 Skill

1. 建立 skill 資料夾：
   ```bash
   mkdir my-new-skill
   ```

2. 建立 `SKILL.md` 並編輯內容

3. 部署到對應的 AI Agent skills 目錄

## 🔗 參考資料

- [Agent Skills 開放標準](https://agentskills.io/specification)
- [高見龍 Claude Code Skills：讓 AI 變身專業工匠](https://kaochenlong.com/claude-code-skills)
- [Anthropic 官方文件](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills)
