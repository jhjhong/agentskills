#!/bin/bash

# Deploy all skills to supported AI Agents using symbolic links
# Usage: ./deploy.sh [--copy] [--force]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"  # New skills directory
USE_SYMLINK=true
REMOVE_MODE=false
FORCE_MODE=false

# Helper for parsing arguments
for arg in "$@"; do
    case $arg in
        --copy) USE_SYMLINK=false ;;
        --remove) REMOVE_MODE=true ;;
        --force) FORCE_MODE=true ;;
    esac
done

# Enable nullglob
shopt -s nullglob

# Target directories
# Format: "Agent Name|skills_subdir|parent_dir_to_check"
AGENT_CONFIGS=(
    "Claude Code|$HOME/.claude/skills|$HOME/.claude"
    "Gemini CLI|$HOME/.gemini/skills|$HOME/.gemini"
    "Google Antigravity|$HOME/.gemini/antigravity/skills|$HOME/.gemini/antigravity"
    "Cursor|$HOME/.cursor/skills|$HOME/.cursor"
    "GitHub Copilot|$HOME/.copilot/skills|$HOME/.copilot"
    "OpenAI Codex|$HOME/.codex/skills|$HOME/.codex"
    "OpenCode|$HOME/.config/opencode/skill|$HOME/.config/opencode"
    "Windsurf|$HOME/.codeium/windsurf/skills|$HOME/.codeium/windsurf"
)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

is_agent_installed() {
    [[ -d "$1" ]]
}

# Main
echo ""
echo "════════════════════════════════════════════════"

if $REMOVE_MODE; then
    echo -e "${RED}🗑️  Removing Agent Skills${NC}"
else
    if $USE_SYMLINK; then
        echo -e "${GREEN}🔗 Deploying Agent Skills (Symbolic Links)${NC}"
    else
        echo -e "${GREEN}📁 Deploying Agent Skills (Copy)${NC}"
    fi
fi

echo "════════════════════════════════════════════════"
echo ""

# Find skills in skills/ directory
skills=()
# Check if skills directory exists
if [[ -d "$SKILLS_DIR" ]]; then
    for dir in "$SKILLS_DIR"/*/; do
        if [[ -f "$dir/SKILL.md" ]]; then
            skills+=("$(basename "$dir")")
        fi
    done
fi

if [[ ${#skills[@]} -eq 0 ]]; then
    echo -e "${YELLOW}⚠️  No skills found in $SKILLS_DIR${NC}"
    exit 0
fi

# Calculate stats
installed_count=0
for config in "${AGENT_CONFIGS[@]}"; do
    check_dir="${config#*|}"
    check_dir="${check_dir#*|}"
    if is_agent_installed "$check_dir"; then
        ((installed_count++))
    fi
done
total_agents=${#AGENT_CONFIGS[@]}

echo -e "Found ${GREEN}${#skills[@]}${NC} skill(s): ${skills[*]}"
echo -e "Target: ${GREEN}${installed_count}${NC}/${total_agents} installed AI agents"
if $FORCE_MODE; then echo -e "        (Force mode enabled)"; fi
echo ""

# Process skills
for skill_name in "${skills[@]}"; do
    if $REMOVE_MODE; then
        echo -e "${RED}🗑️  Removing: ${NC}$skill_name"
    else
        echo -e "${BLUE}📦 Deploying: ${NC}$skill_name"
    fi

    # Update source path to include skills/
    skill_source="$SKILLS_DIR/$skill_name"
    
    for config in "${AGENT_CONFIGS[@]}"; do
        agent_name="${config%%|*}"
        remainder="${config#*|}"
        target_dir="${remainder%%|*}"
        check_dir="${remainder#*|}"
        
        target_path="$target_dir/$skill_name"
        
        if ! $FORCE_MODE && ! is_agent_installed "$check_dir"; then
            echo -e "   ${GRAY}○ $agent_name (not installed)${NC}"
            continue
        fi
        
        if $REMOVE_MODE; then
            if [[ -e "$target_path" || -L "$target_path" ]]; then
                rm -rf "$target_path"
                echo -e "   ${GREEN}✓${NC} $agent_name"
            fi
        else
            mkdir -p "$target_dir"
            rm -rf "$target_path"
            
            if $USE_SYMLINK; then
                ln -s "$skill_source" "$target_path"
                echo -e "   ${GREEN}✓${NC} $agent_name ${YELLOW}(symlink)${NC}"
            else
                cp -r "$skill_source" "$target_path"
                echo -e "   ${GREEN}✓${NC} $agent_name ${YELLOW}(copy)${NC}"
            fi
        fi
    done
    echo ""
done

echo "════════════════════════════════════════════════"
if $REMOVE_MODE; then
    echo -e "${GREEN}✨ Removal complete${NC}"
else
    echo -e "${GREEN}✨ Deployment complete${NC}"
    if $USE_SYMLINK; then
        echo -e "${YELLOW}💡 Tip: Add new skills to the 'skills/' folder!${NC}"
    fi
fi
echo "════════════════════════════════════════════════"
