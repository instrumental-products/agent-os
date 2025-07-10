#!/bin/bash

# Agent OS Setup Script
# This script installs Agent OS files to your system

set -e  # Exit on error

echo "🚀 Agent OS Setup Script"
echo "========================"
echo ""

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/instrumental-products/agent-os/main"

# Create directories
echo "📁 Creating directories..."
mkdir -p "$HOME/.agent-os/standards"
mkdir -p "$HOME/.agent-os/instructions"
mkdir -p "$HOME/.claude/commands"

# Download standards files
echo ""
echo "📥 Downloading standards files to ~/.agent-os/standards/"

# tech-stack.md
if [ -f "$HOME/.agent-os/standards/tech-stack.md" ]; then
    echo "  ⚠️  ~/.agent-os/standards/tech-stack.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/standards/tech-stack.md" "${BASE_URL}/standards/tech-stack.md"
    echo "  ✓ ~/.agent-os/standards/tech-stack.md"
fi

# code-style.md
if [ -f "$HOME/.agent-os/standards/code-style.md" ]; then
    echo "  ⚠️  ~/.agent-os/standards/code-style.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/standards/code-style.md" "${BASE_URL}/standards/code-style.md"
    echo "  ✓ ~/.agent-os/standards/code-style.md"
fi

# best-practices.md
if [ -f "$HOME/.agent-os/standards/best-practices.md" ]; then
    echo "  ⚠️  ~/.agent-os/standards/best-practices.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/standards/best-practices.md" "${BASE_URL}/standards/best-practices.md"
    echo "  ✓ ~/.agent-os/standards/best-practices.md"
fi

# Download instruction files
echo ""
echo "📥 Downloading instruction files to ~/.agent-os/instructions/"

# plan-product.md
if [ -f "$HOME/.agent-os/instructions/plan-product.md" ]; then
    echo "  ⚠️  ~/.agent-os/instructions/plan-product.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/instructions/plan-product.md" "${BASE_URL}/instructions/plan-product.md"
    echo "  ✓ ~/.agent-os/instructions/plan-product.md"
fi

# plan-project.md
if [ -f "$HOME/.agent-os/instructions/plan-project.md" ]; then
    echo "  ⚠️  ~/.agent-os/instructions/plan-project.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/instructions/plan-project.md" "${BASE_URL}/instructions/plan-project.md"
    echo "  ✓ ~/.agent-os/instructions/plan-project.md"
fi

# execute-task.md
if [ -f "$HOME/.agent-os/instructions/execute-task.md" ]; then
    echo "  ⚠️  ~/.agent-os/instructions/execute-task.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/instructions/execute-task.md" "${BASE_URL}/instructions/execute-task.md"
    echo "  ✓ ~/.agent-os/instructions/execute-task.md"
fi

# analyze-product.md
if [ -f "$HOME/.agent-os/instructions/analyze-product.md" ]; then
    echo "  ⚠️  ~/.agent-os/instructions/analyze-product.md already exists - skipping"
else
    curl -s -o "$HOME/.agent-os/instructions/analyze-product.md" "${BASE_URL}/instructions/analyze-product.md"
    echo "  ✓ ~/.agent-os/instructions/analyze-product.md"
fi

# Download command files for Claude Code
echo ""
echo "📥 Downloading Claude Code command files to ~/.claude/commands/"

# Commands
for cmd in plan-product plan-project execute-task analyze-product; do
    if [ -f "$HOME/.claude/commands/${cmd}.md" ]; then
        echo "  ⚠️  ~/.claude/commands/${cmd}.md already exists - skipping"
    else
        curl -s -o "$HOME/.claude/commands/${cmd}.md" "${BASE_URL}/commands/${cmd}.md"
        echo "  ✓ ~/.claude/commands/${cmd}.md"
    fi
done

# Download Claude Code user CLAUDE.md
echo ""
echo "📥 Downloading Claude Code configuration to ~/.claude/"

if [ -f "$HOME/.claude/CLAUDE.md" ]; then
    echo "  ⚠️  ~/.claude/CLAUDE.md already exists - skipping"
else
    curl -s -o "$HOME/.claude/CLAUDE.md" "${BASE_URL}/claude-code/user/CLAUDE.md"
    echo "  ✓ ~/.claude/CLAUDE.md"
fi

echo ""
echo "✅ Agent OS base installation complete!"
echo ""
echo "📍 Files installed to:"
echo "   ~/.agent-os/standards/     - Your development standards"
echo "   ~/.agent-os/instructions/  - Agent OS instructions"
echo "   ~/.claude/commands/        - Claude Code commands"
echo "   ~/.claude/CLAUDE.md        - Claude Code configuration"
echo ""
echo "💡 Note: Existing files were skipped to preserve your customizations"
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
