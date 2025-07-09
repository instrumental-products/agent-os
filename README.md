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

With all three layers in place, your agent has everything it needs: how you build (Standards), what you're building (Product), and what to build next (Project). No more confusion, no more rewrites—just clean, consistent code that looks like you wrote it.

---

## Installation

Getting started with Agent OS is a two-step process: first install your global standards, then set up your product repository.

### Quick Start

Choose your setup based on the AI tools you use:

| Your Tools | Standards Location | Instructions |
|------------|-------------------|---------------|
| Claude Code only | `~/.claude/` | [Jump to Claude Code setup](#claude-code-setup) |
| Cursor only | `~/.cursor/` | [Jump to Cursor setup](#cursor-setup) |
| Both Claude & Cursor | Both locations | [Jump to hybrid setup](#hybrid-setup) |
| Other tools | Varies | [Jump to custom setup](#custom-setup) |

---

### Claude Code Setup {#claude-code-setup}

#### Step 1: Install Global Standards & Instructions

1. Create Claude's Agent OS directories:
   ```bash
   mkdir -p ~/.claude/agent-os/standards
   mkdir -p ~/.claude/agent-os/instructions
   ```

2. Copy the [standards files](https://github.com/buildermethods/agent-os/tree/main/standards) to `~/.claude/agent-os/standards/`:
   - [`tech-stack.md`](https://github.com/buildermethods/agent-os/blob/main/standards/tech-stack.md)
   - [`code-style.md`](https://github.com/buildermethods/agent-os/blob/main/standards/code-style.md)
   - [`best-practices.md`](https://github.com/buildermethods/agent-os/blob/main/standards/best-practices.md)

3. Copy the [instruction files](https://github.com/buildermethods/agent-os/tree/main/instructions) to `~/.claude/agent-os/instructions/`:
   - [`plan-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-product.md)
   - [`plan-project.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-project.md)
   - [`execute-task.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/execute-task.md)
   - [`analyze-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/analyze-product.md)

4. Customize the standards files to match your preferences

#### Step 2: Set Up Your Product Repository

Simply copy [`CLAUDE.md`](https://github.com/buildermethods/agent-os/blob/main/CLAUDE.md) to your project root.

That's it! Claude Code will now use Agent OS when working on your codebase. The `.agent-os/product/` folder will be created when you run the plan-product instruction.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Cursor Setup {#cursor-setup}

#### Step 1: Install Global Standards & Instructions

1. Create Cursor's Agent OS directories:
   ```bash
   mkdir -p ~/.cursor/agent-os/standards
   mkdir -p ~/.cursor/agent-os/instructions
   ```

2. Copy the [standards files](https://github.com/buildermethods/agent-os/tree/main/standards) to `~/.cursor/agent-os/standards/`:
   - [`tech-stack.md`](https://github.com/buildermethods/agent-os/blob/main/standards/tech-stack.md)
   - [`code-style.md`](https://github.com/buildermethods/agent-os/blob/main/standards/code-style.md)
   - [`best-practices.md`](https://github.com/buildermethods/agent-os/blob/main/standards/best-practices.md)

3. Copy the [instruction files](https://github.com/buildermethods/agent-os/tree/main/instructions) to `~/.cursor/agent-os/instructions/`:
   - [`plan-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-product.md)
   - [`plan-project.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-project.md)
   - [`execute-task.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/execute-task.md)
   - [`analyze-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/analyze-product.md)

4. Customize the standards files to match your preferences

#### Step 2: Set Up Your Product Repository

Create a `.cursorrules` file in your project root:
```bash
echo "# Agent OS Integration
Always reference and follow:
- Standards: ~/.cursor/agent-os/standards/
- Product docs: .agent-os/product/
- Instructions: ~/.cursor/agent-os/instructions/" > .cursorrules
```

That's it! The `.agent-os/product/` folder will be created when you run the plan-product instruction.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Hybrid Setup {#hybrid-setup}

Using both Claude Code and Cursor? Set them up to share the same standards:

#### Step 1: Install Shared Standards & Instructions

1. Set up in Cursor's directory first:
   ```bash
   mkdir -p ~/.cursor/agent-os/standards
   mkdir -p ~/.cursor/agent-os/instructions
   ```

2. Copy all the [standards files](https://github.com/buildermethods/agent-os/tree/main/standards) to `~/.cursor/agent-os/standards/`

3. Copy all the [instruction files](https://github.com/buildermethods/agent-os/tree/main/instructions) to `~/.cursor/agent-os/instructions/`

4. Create a symbolic link for Claude Code:
   ```bash
   mkdir -p ~/.claude
   ln -s ~/.cursor/agent-os ~/.claude/agent-os
   ```

Now both tools share the same standards and instructions - edit in either location!

#### Step 2: Set Up Your Product Repository

Follow the product setup steps from either Claude Code or Cursor above, but do both:
- Add `CLAUDE.md` for Claude Code
- Add `.cursorrules` for Cursor

---

### Custom Setup {#custom-setup}

Agent OS is just markdown files and folders. To adapt it for any AI coding tool:

1. **Find your tool's config location** - Check your tool's docs for where it reads global configuration
2. **Copy the standards and instructions** - Download from [Agent OS repo](https://github.com/buildermethods/agent-os) to that location
3. **Reference from projects** - Use your tool's method for including external context

---

### Working with Existing Codebases

Already have a product in development? Agent OS works great with existing code:

1. Create the Agent OS structure in your existing project:
   ```bash
   mkdir -p .agent-os/product
   mkdir -p .agent-os/projects
   mkdir -p .agent-os/instructions
   ```

2. Copy the instruction files and set up your tool integration (CLAUDE.md or .cursorrules)

2. Run the product planning instruction to analyze your codebase:
   ```
   @~/.claude/agent-os/instructions/plan-product

   Analyze my existing codebase and create the Agent OS product documentation
   ```

---

### What Gets Installed Where?

After installation, you'll have:

**On your system (global):**
```
~/.claude/agent-os/          # or ~/.cursor/agent-os/
├── standards/
│   ├── tech-stack.md       # Your default tech choices
│   ├── code-style.md       # Your formatting preferences
│   └── best-practices.md   # Your development philosophy
└── instructions/
    ├── plan-product.md     # How to initialize products
    ├── plan-project.md     # How to plan features
    ├── execute-task.md     # How to build and ship
    └── analyze-product.md  # How to add to existing code
```

**In each product (local):**
```
your-product/
├── .agent-os/
│   ├── product/
│   │   └── (created by plan-product)
│   └── projects/
│       └── (created by plan-project)
├── CLAUDE.md               # If using Claude Code
└── .cursorrules           # If using Cursor
```

Ready to use Agent OS? Continue to [Using Agent OS](#using-agent-os) →
