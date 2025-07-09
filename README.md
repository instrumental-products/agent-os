# Stop Prompting AI Coding Agents Like It's 2024

_Your coding agents are capable of so much more—they just need an operating system._

[Agent OS](https://buildermethods.com/agent-os) transforms AI coding agents from confused interns into productive developers. With structured workflows that capture _your_ standards, _your_ stack, and the unique details of your codebase, Agent OS gives your agents everything they need to ship quality code on the first try—not the fifth.

- Works with any AI coding tool (Claude Code, Cursor, Windsurf, etc.)
- Works on new products and established codebases alike.
- Use it across every project, every feature, every sprint.

> _"I created Agent OS to help professional developers and teams unlock the full advantage of building with AI."_ -- Brian Casel, Creator, Educator & Coach @ [Builder Methods](https://buildermethods.com)

---

- [Goals](#goals)
- [The Three Layers of Context](#the-three-layers-of-context)
  - [Layer 1: Standards (Global)](#layer-1-standards-global)
  - [Layer 2: Product (Codebase-Specific)](#layer-2-product-codebase-specific)
  - [Layer 3: Project (Feature-Specific)](#layer-3-project-feature-specific)
- [Installation](#installation)
  - [Quick Start](#quick-start)
  - [Claude Code Setup](#claude-code-setup)
  - [Cursor Setup](#cursor-setup)
  - [Hybrid Setup](#hybrid-setup)
  - [Custom Setup](#custom-setup)
  - [Working with Existing Codebases](#working-with-existing-codebases)
  - [What Gets Installed Where?](#what-gets-installed-where)
- [Using Agent OS](#using-agent-os)
  - [Setting Your Standards](#setting-your-standards)
  - [Starting a New Product](#starting-a-new-product)
  - [Adding to Existing Products](#adding-to-existing-products)
  - [Planning a Feature](#planning-a-feature)
  - [Executing Tasks](#executing-tasks)
  - [Workflow Examples](#workflow-examples)
  - [Keeping Agent OS Updated](#keeping-agent-os-updated)
  - [Tips for Success](#tips-for-success)
  - [Troubleshooting](#troubleshooting)
- [Refining Your Agent OS](#refining-your-agent-os)
  - [The Refinement Loop](#the-refinement-loop)
  - [Common Refinements](#common-refinements)
  - [Where to Make Updates](#where-to-make-updates)
  - [Making Refinements Stick](#making-refinements-stick)
  - [Team Refinement](#team-refinement)
  - [Signs You Need Refinement](#signs-you-need-refinement)
  - [The Long Game](#the-long-game)
- [FAQ](#faq)

---

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

Getting started with Agent OS is a two-step process: first install your global Agent OS files, then set up your AI tool to use them.

---

### Step 1: Base Installation (All Users)

Everyone starts here, regardless of which AI tool you use:

1. Create the Agent OS directories:
   ```bash
   mkdir -p ~/.agent-os/standards
   mkdir -p ~/.agent-os/instructions
   ```

   **Note:** The `~/` refers to your home directory:
   - **Mac/Linux**: `/Users/yourusername/`
   - **Windows**: `C:\Users\yourusername\` (or use `%USERPROFILE%` in Command Prompt)

2. Copy the [standards files](https://github.com/buildermethods/agent-os/tree/main/standards) to `~/.agent-os/standards/`:
   - [`tech-stack.md`](https://github.com/buildermethods/agent-os/blob/main/standards/tech-stack.md)
   - [`code-style.md`](https://github.com/buildermethods/agent-os/blob/main/standards/code-style.md)
   - [`best-practices.md`](https://github.com/buildermethods/agent-os/blob/main/standards/best-practices.md)

   **Important:** Customize these files to match your preferences. This is where you define YOUR way of building software.

3. Copy the [instruction files](https://github.com/buildermethods/agent-os/tree/main/instructions) to `~/.agent-os/instructions/`:
   - [`plan-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-product.md)
   - [`plan-project.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/plan-project.md)
   - [`execute-task.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/execute-task.md)
   - [`analyze-product.md`](https://github.com/buildermethods/agent-os/blob/main/instructions/analyze-product.md)

   **Note:** These instruction files work well as-is, but you're welcome to review and adjust them if needed.

Now proceed to Step 2 for your specific AI tool.

---

### Step 2: Tool-Specific Setup

Choose your AI tool:

| Your Tool | Additional Setup | Instructions |
|-----------|------------------|---------------|
| Claude Code | Copy to `~/.claude/commands/` | [Jump to Claude Code setup](#claude-code-setup) |
| Cursor | Add to each project | [Jump to Cursor setup](#cursor-setup) |
| Both Claude Code and Cursor | Set up both tools | [Jump to hybrid setup](#hybrid-setup) |
| Other tools | Varies by tool | [Jump to custom setup](#custom-setup) |

### Claude Code Setup

1. Copy the [command files](https://github.com/buildermethods/agent-os/tree/main/commands) to `~/.claude/commands/`:
   ```bash
   cp -r commands/* ~/.claude/commands/
   ```

2. Copy the user-level CLAUDE.md file to your Claude home directory:
   ```bash
   cp claude-code/user/CLAUDE.md ~/.claude/CLAUDE.md
   ```

   This file helps Claude Code understand your global Agent OS standards.

3. In each project where you want to use Agent OS, copy the project-level CLAUDE.md:
   ```bash
   cp claude-code/project/CLAUDE.md ./CLAUDE.md
   ```

   This file helps Claude Code understand your project-specific context.

That's it! You can now use commands like `@plan-product` in Claude Code.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Cursor Setup

For each project where you want to use Agent OS:

1. Create the Cursor rules directory:
   ```bash
   mkdir -p .cursor/rules
   ```

2. Copy the [command files](https://github.com/buildermethods/agent-os/tree/main/commands) to `.cursor/rules/` and rename them:
   ```bash
   cp commands/plan-product.md .cursor/rules/plan-product.mdc
   cp commands/plan-project.md .cursor/rules/plan-project.mdc
   cp commands/execute-task.md .cursor/rules/execute-task.mdc
   cp commands/analyze-product.md .cursor/rules/analyze-product.mdc
   ```

You can now use commands like `@plan-product` in Cursor.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Hybrid Setup

Using both Claude Code and Cursor?

1. Complete the [base installation](#step-1-base-installation-all-users)
2. Follow the [Claude Code setup](#claude-code-setup) to enable global commands
3. For each project, follow the [Cursor setup](#cursor-setup) to add project rules

Both tools will now work with the same Agent OS installation.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Custom Setup

Agent OS is just markdown files. To adapt it for any AI tool:

1. Complete the [base installation](#step-1-base-installation-all-users)
2. Find where your tool looks for commands or context
3. Copy our command files there, adjusting the format as needed

The command files simply point to your `~/.agent-os/` installation.

[→ Continue to Using Agent OS](#using-agent-os)

---

### Working with Existing Codebases

Already have a product in development? Agent OS works great with existing code:

1. Complete the installation for your tool (above)

2. Run the analyze command:
   ```
   @analyze-product

   I want to install Agent OS in my existing codebase
   ```

This will analyze your codebase, understand what's already built, and create Agent OS documentation that reflects your actual implementation.

[→ Continue to Using Agent OS](#using-agent-os)

---

### What Gets Installed Where?

After installation, you'll have:

**Base Installation (All Users):**
```
~/.agent-os/
├── standards/
│   ├── tech-stack.md       # Your default tech choices
│   ├── code-style.md       # Your formatting preferences
│   └── best-practices.md   # Your development philosophy
└── instructions/
    ├── plan-product.md     # Agent's instructions to initialize a product
    ├── plan-project.md     # Agent's instructions to plan features
    ├── execute-task.md     # Agent's instructions to build and ship
    └── analyze-product.md  # Agent's instructions to add to existing code
```

**Claude Code Addition:**
```
~/.claude/
├── CLAUDE.md               # References your global standards
└── commands/
    ├── plan-product.md     # → points to ~/.agent-os/instructions/
    ├── plan-project.md     # → points to ~/.agent-os/instructions/
    ├── execute-task.md     # → points to ~/.agent-os/instructions/
    └── analyze-product.md  # → points to ~/.agent-os/instructions/

your-product/
└── CLAUDE.md               # References project-specific context
```

**Cursor Addition (Per Project):**
```
your-product/
├── .cursor/
│   └── rules/
│       ├── plan-product.mdc     # → points to ~/.agent-os/instructions/
│       ├── plan-project.mdc     # → points to ~/.agent-os/instructions/
│       ├── execute-task.mdc     # → points to ~/.agent-os/instructions/
│       └── analyze-product.mdc  # → points to ~/.agent-os/instructions/
├── .agent-os/
│   ├── product/                 # Created by plan-product
│   └── projects/                # Created by plan-project
├── CLAUDE.md                    # If using Claude Code
└── .cursorrules                 # (Deprecated - use .cursor/rules/ instead)
```

Ready to use Agent OS? Continue to [Using Agent OS](#using-agent-os) →

---

## Using Agent OS

With Agent OS installed, you're ready to supercharge your AI coding workflow. Here's how to use each part:

### Setting Your Standards

Before starting any project, customize your global standards to match how you like to build. **Your agent will reference these standards constantly** when planning projects and writing code, so make them reflect your actual preferences:

1. **Edit your tech stack** (`~/.claude/agent-os/standards/tech-stack.md`):
   - Set your preferred frameworks and versions
   - Define default database choices
   - Specify hosting preferences

2. **Define your code style** (`~/.claude/agent-os/standards/code-style.md`):
   - Indentation preferences (spaces vs tabs, how many)
   - Naming conventions (camelCase vs snake_case)
   - File organization patterns

3. **Document your best practices** (`~/.claude/agent-os/standards/best-practices.md`):
   - Testing philosophy (TDD? Integration first?)
   - Performance vs readability trade-offs
   - Security considerations

💡 **Pro tip:** Be opinionated! The more specific your standards, the more consistent your agent's output.

### Starting a New Product

When beginning a fresh codebase, you can provide as much or as little detail as you want—though more detail leads to better results:

```
@~/.claude/agent-os/instructions/plan-product

I want to build a SaaS tool for tracking customer feedback
Key features: feedback collection, sentiment analysis, reporting dashboard
Target users: Product managers at B2B SaaS companies
Tech stack: Use my defaults
```

Your agent will:
- ✅ Create `.agent-os/product/` structure
- ✅ Generate mission.md with product vision
- ✅ Create a 5-phase roadmap
- ✅ Document all technical decisions
- ✅ Set up your preferred tech stack

**Important:** Review and edit the generated documentation to ensure it accurately reflects your vision and goals.

### Adding to Existing Products

Have an existing codebase? No problem:

```
@~/.claude/agent-os/instructions/analyze-product

I want to install Agent OS in my existing codebase
```

Your agent will:
- 🔍 Analyze your current code structure
- 📊 Detect your tech stack and patterns
- 📝 Create documentation reflecting what's already built
- ✅ Add completed features to "Phase 0" in the roadmap

**Important:** Review the generated documentation carefully—your agent's analysis might miss nuances or business context that only you know.

### Planning a Feature

Ready to build something new? You have two options:

**Option 1: Ask what's next**
```
What's next?
```

Your agent will check the roadmap and suggest the next uncompleted feature.

**Option 2: Request a specific feature**
```
@~/.claude/agent-os/instructions/plan-project

Let's add user authentication with email/password and OAuth
```

Either way, your agent will:
- 📋 Create a Project Requirements Document (PRD)
- 🔧 Write technical specifications
- 💾 Design database schemas (if needed)
- 🔌 Document API endpoints (if needed)
- ✅ Break down work into ordered tasks

**Important:** This is the most critical review point! Carefully examine the PRD, specs, and especially the task breakdown. Adjust anything that doesn't match your expectations before proceeding.

Projects live in: `.agent-os/projects/2024-12-20-user-authentication/`

### Executing Tasks

Time to code! Start building:

```
@~/.claude/agent-os/instructions/execute-task

Work on the next task in the user authentication project
```

By default, your agent will complete one parent task and all its sub-tasks. You can adjust this:
- **More work:** "Complete tasks 1 and 2 with all sub-tasks"
- **Less work:** "Just do task 1.1 and 1.2"
- **Specific task:** "Work on task 3: API endpoints"

Your agent will:
- 📝 Follow your coding standards exactly
- 🧪 Write tests first (if that's your style)
- 💾 Commit with clear messages
- ✅ Update task progress as it goes
- 🔊 Play a sound when done

**Important:** While agents are great at following patterns, always review the code for business logic accuracy and edge cases before merging.

### Workflow Examples

#### Example 1: Monday Morning

```
What's next on the roadmap?
```

Your agent checks `.agent-os/product/roadmap.md` and suggests the next uncompleted feature.

#### Example 2: Quick Bug Fix

```
@~/.claude/agent-os/instructions/plan-project

Users report the dashboard is slow when filtering by date
```

Even for bug fixes, your agent creates a mini-project with clear tasks.

#### Example 3: Continuing Work

```
@~/.claude/agent-os/instructions/execute-task

Continue where we left off yesterday
```

Your agent reads the task list and picks up exactly where it stopped.

### Keeping Agent OS Updated

While the task execution process automatically updates your roadmap and prompts for decision updates, it's good practice to regularly:

1. **Review and refine your standards** - As you see patterns in code reviews, update your standards files
2. **Manually check roadmap.md** - Ensure it reflects actual progress and priorities
3. **Update decisions.md** - Document important choices that affect future development
4. **Refine best-practices.md** - Add patterns that help your agent think like you think

Regular maintenance keeps your Agent OS aligned with your evolving project and team needs.

### Tips for Success

**Review Plans Carefully**
- The planning phase is crucial—invest time here to save time later
- Review the PRD and task breakdown before execution
- Ask your agent to adjust plans if something doesn't look right
- Ensure you're aligned on the approach before coding begins

**Start Small**
- Don't try to document everything at once
- Begin with basic standards, refine as you go

**Be Specific**
- "Use PostgreSQL" → "Use PostgreSQL 15+ with schemas for multi-tenancy"
- "Write tests" → "Write unit tests first, aim for 80% coverage"

**Trust the Process**
- Let your agent own entire features, not just snippets
- Review and refine rather than micromanage

**Know When to Start Fresh**
- Not happy with the implementation? It's often better to revert and redo with better planning
- Don't ask your agent to fix incorrectly implemented code—start clean with refined specs
- A clear redo usually beats incremental fixes

### Troubleshooting

**Agent not following your style?**
- Check your standards files are specific enough
- Add examples to code-style.md
- Update best-practices.md with clear dos and don'ts

**Tasks too big or too small?**
- This is a planning issue—catch it early!
- During plan-project, review the task breakdown carefully
- Ask your agent to adjust: "Can you break task 3 into smaller sub-tasks?"
- Or: "Tasks 2 and 3 should be combined"

**Wrong technical approach?**
- Review technical specs during the planning phase
- Don't wait until code is written to course-correct
- Say: "I'd prefer we use [different approach] for this"
- Update tech-stack.md, decisions.md, or best-practices.md to prevent future issues
- Best-practices.md is especially important—it teaches your agent to think like you

**Remember:** The best time to fix issues is during planning, not after code is written!

---

## Refining Your Agent OS

Agent OS gets better with use. Each project teaches you something about your process, your preferences, and how to better guide your AI agents. Here's how to continuously improve your setup.

### The Refinement Loop

After each feature or project, ask yourself:

1. **What worked well?** - Patterns to document and repeat
2. **What needed correction?** - Gaps in your standards or instructions
3. **What surprised you?** - Unexpected approaches that might be worth adopting

### Common Refinements

**After Your First Project**
- Add specific examples to code-style.md based on actual code
- Update best-practices.md with patterns you had to correct
- Clarify any tech stack choices that caused confusion

**After Code Reviews**
- Notice yourself making the same corrections? Add them to standards
- Find a pattern you love? Document it so agents use it consistently
- Spot anti-patterns? Add them to best-practices.md with clear "don't do this" examples

**After Team Feedback**
- Incorporate team preferences into your standards
- Add team-specific workflows to best-practices.md
- Document naming conventions everyone agrees on

### Where to Make Updates

**Standards Files** (Global - affects all projects)
- `tech-stack.md` - New tool preferences, version updates
- `code-style.md` - Formatting patterns, naming conventions
- `best-practices.md` - Development philosophy, patterns to follow/avoid

**Product Files** (Project-specific)
- `roadmap.md` - Adjust phases based on learnings
- `decisions.md` - Document why certain approaches work (or don't)
- `tech-stack.md` - Override global standards when needed

### Making Refinements Stick

**Be Specific**
- ❌ "Write better tests"
- ✅ "Write integration tests first, then unit tests. Mock external services using [specific pattern]"

**Show, Don't Just Tell**
- Include code examples in your standards
- Show both good and bad patterns
- Explain why one approach is preferred

**Version Your Changes**
- Update version numbers when making significant changes
- Keep a brief changelog at the bottom of modified files
- This helps track what changed and when

### Team Refinement

If working with a team:

1. **Schedule Regular Reviews** - Monthly or after major features
2. **Collect Patterns** - What is everyone correcting in code reviews?
3. **Reach Consensus** - Agree on patterns before adding to standards
4. **Share Updates** - Ensure everyone updates their local Agent OS files

### Signs You Need Refinement

- You're making the same corrections repeatedly
- Agents consistently miss certain patterns
- Code reviews reveal style inconsistencies
- New team members point out unclear conventions
- You discover better patterns worth standardizing

### The Long Game

Remember: Agent OS is a living system. The goal isn't perfection on day one—it's continuous improvement. Each refinement makes your agents more effective and your codebase more consistent.

Your Agent OS a year from now will be dramatically better than today's, shaped by real experience and tailored to exactly how you and your team work best.

---

## FAQ

**Q: How often should I update my standards?**
A: Whenever you notice patterns worth documenting. Some teams update weekly, others monthly. Find your rhythm.

**Q: Can I have different standards for different projects?**
A: Yes! Global standards are defaults. Override them in `.agent-os/product/` files for project-specific needs.

**Q: Should I version control my global standards?**
A: Absolutely. Keep `~/.claude/agent-os/` in a private git repo to track changes and share with your team.

**Q: What if my team disagrees on standards?**
A: Document the discussion in decisions.md, choose an approach, and try it. You can always refine later based on results.

**Q: How detailed should standards be?**
A: Detailed enough that two different agents would produce similar code. Start simple, add detail where you see variation.

**Q: Can someone help me or my team implement Agent OS?**
A: Yes! Brian Casel, the creator of Agent OS, offers coaching and courses for individuals and teams.  Visit [Builder Methods](https://buildermethods.com) to learn more and find an option that's right for you.
