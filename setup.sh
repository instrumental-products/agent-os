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
mkdir -p ~/.agent-os/standards
mkdir -p ~/.agent-os/instructions
mkdir -p ~/.claude/commands

# Download standards files
echo ""
echo "📥 Downloading standards files to ~/.agent-os/standards/"
curl -s -o ~/.agent-os/standards/tech-stack.md "$BASE_URL/standards/tech-stack.md"
echo "  ✓ ~/.agent-os/standards/tech-stack.md"
curl -s -o ~/.agent-os/standards/code-style.md "$BASE_URL/standards/code-style.md"
echo "  ✓ ~/.agent-os/standards/code-style.md"
curl -s -o ~/.agent-os/standards/best-practices.md "$BASE_URL/standards/best-practices.md"
echo "  ✓ ~/.agent-os/standards/best-practices.md"

# Download instruction files
echo ""
echo "📥 Downloading instruction files to ~/.agent-os/instructions/"
curl -s -o ~/.agent-os/instructions/plan-product.md "$BASE_URL/instructions/plan-product.md"
echo "  ✓ ~/.agent-os/instructions/plan-product.md"
curl -s -o ~/.agent-os/instructions/plan-project.md "$BASE_URL/instructions/plan-project.md"
echo "  ✓ ~/.agent-os/instructions/plan-project.md"
curl -s -o ~/.agent-os/instructions/execute-task.md "$BASE_URL/instructions/execute-task.md"
echo "  ✓ ~/.agent-os/instructions/execute-task.md"
curl -s -o ~/.agent-os/instructions/analyze-product.md "$BASE_URL/instructions/analyze-product.md"
echo "  ✓ ~/.agent-os/instructions/analyze-product.md"

# Download command files for Claude Code
echo ""
echo "📥 Downloading Claude Code command files to ~/.claude/commands/"
curl -s -o ~/.claude/commands/plan-product.md "$BASE_URL/commands/plan-product.md"
echo "  ✓ ~/.claude/commands/plan-product.md"
curl -s -o ~/.claude/commands/plan-project.md "$BASE_URL/commands/plan-project.md"
echo "  ✓ ~/.claude/commands/plan-project.md"
curl -s -o ~/.claude/commands/execute-task.md "$BASE_URL/commands/execute-task.md"
echo "  ✓ ~/.claude/commands/execute-task.md"
curl -s -o ~/.claude/commands/analyze-product.md "$BASE_URL/commands/analyze-product.md"
echo "  ✓ ~/.claude/commands/analyze-product.md"

# Download Claude Code user CLAUDE.md
echo ""
echo "📥 Downloading Claude Code configuration to ~/.claude/"
curl -s -o ~/.claude/CLAUDE.md "$BASE_URL/claude-code/user/CLAUDE.md"
echo "  ✓ ~/.claude/CLAUDE.md (user configuration)"

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
