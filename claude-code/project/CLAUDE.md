# CLAUDE.md

> Agent OS Integration File
> Last Updated: 2025-09-15

## Purpose

This file directs Claude Code to use the Agent OS documentation system for all development work in this repository. Always reference the Agent OS files below before writing any code.

## Agent OS Documentation

### Product Context
- **Mission & Vision:** @.agent_os/product/mission.md
- **Technical Architecture:** @.agent_os/product/tech-stack.md
- **Development Roadmap:** @.agent_os/product/roadmap.md
- **Decision History:** @.agent_os/product/decisions.md

### Development Standards
- **Code Style:** @.agent_os/product/code-style.md
- **Best Practices:** @.agent_os/product/dev-best-practices.md

### Project Management
- **Active Projects:** @.agent_os/projects/
- **Project Planning:** Use `@.agent_os/instructions/plan-project.md`
- **Task Execution:** Use `@.agent_os/instructions/execute-task.md`

## Workflow Instructions

When asked to work on this codebase:

1. **First**, check @.agent_os/product/roadmap.md for current priorities
2. **Then**, follow the appropriate instruction file:
   - For new features: @.agent_os/instructions/plan-project.md
   - For task execution: @.agent_os/instructions/execute-task.md
3. **Always**, adhere to the standards in the files listed above

## Important Notes

- Product-specific files in `.agent_os/product/` override any global standards
- Check for existing projects in `.agent_os/projects/` before starting new work
- All code must follow the established patterns and practices documented above

---

*This repository uses Agent OS for structured AI-assisted development. Learn more at [buildermethods.com/agent-os](https://buildermethods.com/agent-os)*
