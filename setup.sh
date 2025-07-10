#!/bin/bash

# Agent OS Setup Script
# This script installs Agent OS files to your system

set -e  # Exit on error

echo "🚀 Agent OS Setup Script"
echo "========================"
echo ""

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/instrumental-products/agent-os/main"

# Function to download file with overwrite check
download_file() {
    local url="$1"
    local dest="$2"
    local desc="$3"

    if [ -f "$dest" ]; then
        echo "  ⚠️  $dest already exists"
        read -p "     Overwrite? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "     ↳ Skipped"
            return
        fi
    fi

    curl -s -o "$dest" "$url"
    echo "  ✓ $dest"
}

# Create directories
echo "📁 Creating directories..."
mkdir -p ~/.agent-os/standards
mkdir -p ~/.agent-os/instructions
mkdir -p ~/.claude/commands

# Download standards files
echo ""
echo "📥 Downloading standards files to ~/.agent-os/standards/"
download_file "$BASE_URL/standards/tech-stack.md" "$HOME/.agent-os/standards/tech-stack.md" "Tech Stack"
download_file "$BASE_URL/standards/code-style.md" "$HOME/.agent-os/standards/code-style.md" "Code Style"
download_file "$BASE_URL/standards/best-practices.md" "$HOME/.agent-os/standards/best-practices.md" "Best Practices"

# Download instruction files
echo ""
echo "📥 Downloading instruction files to ~/.agent-os/instructions/"
download_file "$BASE_URL/instructions/plan-product.md" "$HOME/.agent-os/instructions/plan-product.md" "Plan Product"
download_file "$BASE_URL/instructions/plan-project.md" "$HOME/.agent-os/instructions/plan-project.md" "Plan Project"
download_file "$BASE_URL/instructions/execute-task.md" "$HOME/.agent-os/instructions/execute-task.md" "Execute Task"
download_file "$BASE_URL/instructions/analyze-product.md" "$HOME/.agent-os/instructions/analyze-product.md" "Analyze Product"

# Download command files for Claude Code
echo ""
echo "📥 Downloading Claude Code command files to ~/.claude/commands/"
download_file "$BASE_URL/commands/plan-product.md" "$HOME/.claude/commands/plan-product.md" "Plan Product Command"
download_file "$BASE_URL/commands/plan-project.md" "$HOME/.claude/commands/plan-project.md" "Plan Project Command"
download_file "$BASE_URL/commands/execute-task.md" "$HOME/.claude/commands/execute-task.md" "Execute Task Command"
download_file "$BASE_URL/commands/analyze-product.md" "$HOME/.claude/commands/analyze-product.md" "Analyze Product Command"

# Download Claude Code user CLAUDE.md
echo ""
echo "📥 Downloading Claude Code configuration to ~/.claude/"
download_file "$BASE_URL/claude-code/user/CLAUDE.md" "$HOME/.claude/CLAUDE.md" "Claude Configuration"

echo ""
echo "✅ Agent OS base installation complete!"
echo ""
echo "📍 Files installed to:"
echo "   ~/.agent-os/standards/     - Your development standards"
echo "   ~/.agent-os/instructions/  - Agent OS instructions"
echo "   ~/.claude/commands/        - Claude Code commands"
echo "   ~/.claude/CLAUDE.md        - Claude Code configuration"
echo ""
echo "Next steps:"
echo ""
echo "1. Customize the standards files in ~/.agent-os/standards/"
echo ""
echo "2. For each project:"
echo "   - Claude Code: Copy claude-code/project/CLAUDE.md to .claude/ in your project"
echo "   - Cursor: Copy command files to .cursor/rules/ with .mdc extension"
echo ""
echo "Learn more at https://buildermethods.com/agent-os"
echo ""
