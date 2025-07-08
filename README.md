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
