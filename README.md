# My Agent Skills

個人自訂的 AI Agent Skills 集合，可用於擴展各種 AI Coding Assistant 的功能。

## 🤖 支援的 AI Agents

根據 [Agent Skills 開放標準](https://agentskills.io/specification)，以下是各 AI 工具的 skills 目錄對照：

| 平台 / 工具 | 專案目錄 (Project Scope) | 使用者全域目錄 (Global Scope) |
|-------------|--------------------------|-------------------------------|
| **Claude Code** | `.claude/skills/` | `~/.claude/skills/` |
| **GitHub Copilot** | `.github/skills/` | `~/.copilot/skills/` |
| **Google Antigravity** | `.agent/skills/` | `~/.gemini/antigravity/skills/` |
| **Cursor** | `.cursor/skills/` | `~/.cursor/skills/` |
| **OpenCode** | `.opencode/skill/` | `~/.config/opencode/skill/` |
| **OpenAI Codex** | `.codex/skills/` | `~/.codex/skills/` |
| **Gemini CLI** | `.gemini/skills/` | `~/.gemini/skills/` |
| **Windsurf** | `.windsurf/skills/` | `~/.codeium/windsurf/skills/` |

## 📁 Skills 列表

| Skill | 說明 |
|-------|------|
| [git-commit-helper](./skills/git-commit-helper/) | AI 輔助生成標準化 Git Commit Message |
| [llm-coding-guidelines](./skills/llm-coding-guidelines/) | 減少常見 LLM 編碼錯誤的行為準則 |

## 🚀 部署方式

### 一鍵部署（推薦）

使用部署腳本一次安裝到所有支援的 AI Agents：

```bash
./deploy.sh
```

這會將 `skills/` 資料夾中的所有 skills 自動部署。

### 手動部署

將 skill 複製到對應的目錄：

```bash
# Claude Code
cp -r skills/git-commit-helper ~/.claude/skills/

# Gemini CLI
cp -r skills/git-commit-helper ~/.gemini/skills/

# Google Antigravity
cp -r skills/git-commit-helper ~/.gemini/antigravity/skills/

# Cursor
cp -r skills/git-commit-helper ~/.cursor/skills/

# GitHub Copilot
cp -r skills/git-commit-helper ~/.copilot/skills/
```

### 專案層級部署

將 skills 放到專案目錄，僅該專案可用：

```bash
mkdir -p .claude/skills
cp -r /path/to/my-agent-skills/skills/git-commit-helper .claude/skills/
```

## 📝 Repo 結構

```
my-agent-skills/
├── skills/             # 所有 Skills 存放處
│   ├── git-commit-helper/
│   │   ├── SKILL.md
│   │   └── README.md
│   └── my-new-skill/
├── deploy.sh           # 自動部署腳本
└── README.md
```

## 🛠️ 建立新 Skill

1. 在 `skills/` 建立新資料夾：`mkdir skills/my-new-skill`
2. 建立 `SKILL.md` 並編輯內容
3. 執行 `./deploy.sh` 部署到所有 AI Agents

## 🔗 參考資料

- [Agent Skills 開放標準](https://agentskills.io/specification)
- [Claude Code Skills 教學](https://kaochenlong.com/claude-code-skills)

## 📄 License

MIT
