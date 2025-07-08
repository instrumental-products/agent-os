# Stop Prompting AI Coding Agents Like It's 2024

## Your coding agents are capable of so much more—they just need an operating system.

Agent OS transforms AI coding agents from confused interns into productive developers. With structured workflows that capture _your_ standards, _your_ stack, and the unique details of your codebase, Agent OS gives your agents everything they need to ship quality code on the first try—not the fifth.

Works with any AI coding tool (Claude Code, Cursor, Windsurf, etc.) across every project, every feature, every sprint.

Created by Brian Casel @ [Builder Methods](https://buildermethods.com), who's been shipping production code with AI agents since before it was normal.

---

- [Goals](#goals)
- [Agentic development workflow](#agentic-development-workflow)
  - [1. Your Standards](#1-your-standards)
  - [2. Your Product](#2-your-product)
  - [3. Managing Projects](#3-managing-projects)
  - [4. Executing Tasks](#4-executing-tasks)
  - [5. Refinement](#5-refinement)
- [Installation](#installation)
  - [Install Agent OS for use with Cursor](#install-agent-os-for-use-with-cursor)
  - [Install Agent OS for use with Claude Code](#install-agent-os-for-use-with-claude-code)
  - [Install Agent OS for use with Cursor AND Claude Code](#install-agent-os-for-use-with-cursor-and-claude-code)
  - [Install Agent OS for use with other IDEs](#install-agent-os-for-use-with-other-ides)
  - [Install Agent OS into an existing codebase](#install-agent-os-into-an-existing-codebase)
- [Using Agent OS](#using-agent-os)
  - [Set your standards](#set-your-standards)
  - [Instructing your agents](#instructing-your-agents)
  - [Building a product plan](#building-a-product-plan)
  - [Managing agent projects](#managing-agent-projects)
  - [Executing agent tasks](#executing-agent-tasks)
- [Refining your Agent OS](#refining-your-agent-os)
- [FAQ](#faq)

# Goals

Agent OS helps you:

- **Stop the endless prompt loops** — No more "try again... no, not like that... ugh, let me explain..."
- **Make agents follow YOUR standards** — Your tech stack, your code style, your weird opinions about semicolons
- **Ship actual features** — Not just toy demos, but production-ready code
- **Work with any codebase** — New products, legacy monsters, and everything in between

_Examples use Cursor + Claude Code, but Agent OS works anywhere AI agents do._

# Agentic development workflow

Picture this: You just hired Junior, a fresh bootcamp grad. They're smart, eager, and have no idea how your team works. What do you do?

You don't just point at the codebase and say "figure it out." You onboard them! You explain your standards, show them the product vision, break down their first project into manageable tasks.

**Your AI agent is Junior.** And Agent OS is your onboarding playbook.

## 1. Your Standards

Before Junior writes a single line, they need to know your house rules:

- **Tech Stack**: "We use Next.js, not Create React App"
- **Code Style**: "Tailwind classes go on separate lines" (yes, really)
- **Best Practices**: "Always write tests first, commit often, no console.logs in production"

Agent OS stores these standards in a central location that all your projects can reference. Set them once, use them everywhere.

## 2. Your Product

Next, Junior needs context about what they're building:

- **The Mission**: What problem are we solving? Who are we solving it for?
- **The Stack**: Which specific libraries and services power this product?
- **The Roadmap**: What's been built? What's next? What decisions got us here?

Agent OS creates a `product` folder in your codebase with all this context. Your agent reads it before touching any code.

## 3. Managing Projects

Time for Junior's first real assignment! But you don't just say "build user authentication." You break it down:

- **Project Brief**: Clear goals, scope, and expected outcomes
- **Technical Specs**: Database schema, API endpoints, UI requirements
- **Task List**: Step-by-step implementation plan with dependencies

Agent OS structures projects with PRDs (Project Requirements Documents) and detailed task breakdowns. Your agent knows exactly what to build and in what order.

## 4. Executing Tasks

With all that context, Junior can actually be productive! They:

- Pick up the next task
- Follow your standards
- Write tests first (because you told them to)
- Commit their work
- Update the task list

Agent OS guides your agent through this workflow, ensuring they follow your process every time. No skipped steps, no forgotten tests, no rogue architectural decisions.

## 5. Refinement

After Junior's first project, you debrief. What went well? What could improve? Maybe they need clearer API examples, or you forgot to mention your strong opinions about error handling.

Same with agents. Each project teaches you something about your process. Agent OS grows with you—refine your standards, update your practices, and watch your agents get better with every iteration.

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
