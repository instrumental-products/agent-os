# Stop Prompting AI Coding Agents Like It's 2024

_Your coding agents are capable of so much more—they just need an operating system._

[Agent OS](https://buildermethods.com/agent-os) transforms AI coding agents from confused interns into productive developers. With structured workflows that capture _your_ standards, _your_ stack, and the unique details of your codebase, Agent OS gives your agents everything they need to ship quality code on the first try—not the fifth.

- Works with any AI coding tool (Claude Code, Cursor, Windsurf, etc.)
- Works on new products and established codebases alike.
- Use it across every project, every feature, every sprint.

> _"I created Agent OS to help professional developers and teams unlock the full advantage of building with AI."_ -- Brian Casel, Creator, Educator & Coach @ [Builder Methods](https://buildermethods.com)

---

TABLE OF CONTENTS GOES HERE

## Goals

Agent OS helps you:

- **Stop the endless prompt loops** — No more "try again... no, not like that... ugh, let me explain..."
- **Make agents follow YOUR standards** — Your tech stack, your code style, your weird opinions about semicolons
- **Ship actual features** — Not just toy demos, but production-ready code
- **Work with any codebase** — New products, legacy monsters, and everything in between
- **Work with any AI coding tools** — The examples below use Cursor & Claude Code, but Agent OS works anywhere AI agents do.


## The Three Layers of Context

Agent OS works by layering context—just like you'd onboard a human developer. Each layer builds on the previous one, creating a complete picture of how you build software.

### Layer 1: Standards (Global)

Your universal "how we build" documentation:
- **Tech Stack** — Your default frameworks, libraries, and tools
- **Code Style** — Your formatting rules, naming conventions, and preferences
- **Best Practices** — Your development philosophy (e.g., TDD, commit patterns)

These live on your system (`~/.claude/...` or `~/.cursor/...` or similar) and are referenced from every project. Set once, use everywhere, override as needed.

### Layer 2: Product (Codebase-Specific)

Your product's unique context:
- **Mission** — What you're building, for whom, and why it matters
- **Roadmap** — Features shipped, in progress, and planned
- **Decisions** — Key architectural and technical choices (with rationale)
- **Product-specific stack** — The exact versions and configurations for this codebase

These live in your codebase (`.agent-os/product/`) and give agents the full picture of your product.

### Layer 3: Project (Feature-Specific)

Individual feature specifications:
- **PRD (Project Requirements Document)** — Goals, user stories, success criteria
- **Technical Specs** — API design, database changes, UI requirements
- **Task Breakdown** — Step-by-step implementation plan with dependencies

These live in dated project folders (`.agent-os/projects/2025-12-19-user-auth/`) and guide agents through specific implementations.

---

With all three layers in place, your agent has everything it needs: how you build (Standards), what you're building (Product), and what to build next (Project). No more confusion, no more rewrites—just clean, consistent code that looks like you wrote it.

# Installation

Agent OS adapts to your preferred AI coding environment. Choose your fighter:

## Install Agent OS for use with Cursor

Cursor users get the full Agent OS experience with system-wide memories.

### 1. Install System Memories

First, set up your global standards that work across all projects:

```bash
# Clone the standards to your Cursor config directory
git clone https://github.com/BuilderMethods/agent-os-memories ~/.cursor/agent-os

# Navigate to the memories directory
cd ~/.cursor/agent-os

# Install dependencies
npm install
```

### 2. Install Project Structure

In your project root:

```bash
# Clone the project templates
git clone https://github.com/BuilderMethods/agent-os-project .agent-os

# Remove the git directory (we don't want a repo inside your repo)
rm -rf .agent-os/.git

# Initialize your product documentation
npm run init:product
```

### 3. Configure Cursor Rules

Add to your `.cursorrules` file:

```
# Agent OS Integration
Include: ~/.cursor/agent-os/standards/*
Context: .agent-os/product/*
```

## Install Agent OS for use with Claude Code

Claude Code users can leverage Agent OS through project-level configuration:

```bash
# In your project root
git clone https://github.com/BuilderMethods/agent-os-claude .agent-os
rm -rf .agent-os/.git

# Set up Claude-specific configuration
npm run init:claude
```

## Install Agent OS for use with Cursor AND Claude Code

Want the best of both worlds? Set up a hybrid configuration:

```bash
# Install system memories for Cursor
git clone https://github.com/BuilderMethods/agent-os-memories ~/.cursor/agent-os

# Install project structure with cross-compatibility
git clone https://github.com/BuilderMethods/agent-os-hybrid .agent-os
rm -rf .agent-os/.git

# Initialize for both environments
npm run init:hybrid
```

## Install Agent OS for use with other IDEs

Agent OS is just markdown and structured folders. Adapt it to any AI-enabled IDE:

```bash
# Get the core structure
git clone https://github.com/BuilderMethods/agent-os-core .agent-os
rm -rf .agent-os/.git

# Follow your IDE's documentation for:
# - System-level configuration
# - Project context inclusion
# - Custom instructions
```

## Install Agent OS into an existing codebase

Got a legacy project? Agent OS plays nice:

```bash
# In your existing project root
git clone https://github.com/BuilderMethods/agent-os-project .agent-os
rm -rf .agent-os/.git

# Generate product docs from your existing code
npm run analyze:codebase

# Review and customize the generated documentation
```

# Using Agent OS

With Agent OS installed, here's your new development workflow:

## Set your standards

Edit the files in your standards directory:

- `tech-stack.md` — Your default stack choices
- `code-style.md` — How you write code
- `best-practices.md` — Your development philosophy

Be opinionated! The more specific you are, the better your agents perform.

## Instructing your agents

Agent OS uses three core instructions:

1. **plan-product** — Initialize a new product
2. **plan-project** — Break down a feature into tasks
3. **execute-task** — Build and ship code

Just reference these in your prompts:

```
@agent-os plan-product

I want to build a SaaS for tracking coffee brewing recipes
```

## Building a product plan

When starting a new product:

```
@agent-os plan-product

Product idea: A minimalist todo app that syncs across devices
Key features: Quick add, keyboard shortcuts, offline support
Target users: Power users who live in their terminal
Tech preferences: Use my standard stack
```

Your agent will create a complete product plan with mission, roadmap, and technical decisions.

## Managing agent projects

For new features or major changes:

```
@agent-os plan-project

Let's implement user authentication with email/password
```

Your agent will:
- Check the roadmap for context
- Create a detailed PRD
- Break down all technical requirements
- Generate an ordered task list

## Executing agent tasks

Time to build:

```
@agent-os execute-task

Start working on the next task in the authentication project
```

Your agent will:
- Pick up where they left off
- Follow your coding standards
- Write tests first (if that's your thing)
- Commit with clear messages
- Update progress as they go

# Refining your Agent OS

Your Agent OS gets better with use. After each project:

1. **Review the output** — Did the agent follow your standards?
2. **Update your docs** — Add missing context or clarify confusing parts
3. **Extract patterns** — Notice repeated corrections? Add them to your standards
4. **Share learnings** — Found a great practice? PR it back to the community!

The goal: Make each project smoother than the last.

# FAQ

**Q: Do I need to use all parts of Agent OS?**
A: Nope! Start with standards, add product docs when ready, use projects when you need them.

**Q: Can I use Agent OS with [insert AI tool]?**
A: If it reads markdown and follows instructions, yes. The patterns work everywhere.

**Q: How is this different from just using Custom Instructions?**
A: Custom Instructions are like Post-it notes. Agent OS is like a proper onboarding manual. Both have their place, but one scales better.

**Q: My agent isn't following the instructions perfectly. What's wrong?**
A: Usually it needs more specific examples. Agents learn from patterns—show, don't just tell.

**Q: Can I share my Agent OS setup with my team?**
A: Absolutely! That's the point. Consistent standards across your whole team, humans and agents alike.

---

Ready to give your AI agents the onboarding they deserve? [Get started with Agent OS →](https://github.com/BuilderMethods/agent-os)
