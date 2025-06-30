---
description:
globs:
alwaysApply: false
---

# Product Planning Rules

## Overview

This rule guides the creation of a comprehensive product plan including mission, tech stack, roadmap, and development standards.

# Product Planning Rules

## Overview

This rule guides the creation of a comprehensive product plan including mission, tech stack, roadmap, and development standards.

## Process Flow

### Step 1: Gather User Input

USER provides the following information:

- The main idea for this product
- List of key features
- Target users and their use case(s) for this product
- Tech stack to be used for the development and deployment of this product

If Tech stack specifics haven't been provided, check to see if the user's preferred tech stack can be found in Cursor User Rules or in ~/.claude/CLAUDE.md and if so, use the tech stack details specified there as our default assumed tech stack for this project.

If any the above 4 points are missing, REQUEST clarification from user before proceeding. Otherwise, if you have information all 4 points, then you can proceed with the next step without requesting clarification from user.

**Example user input:**

- Main idea: A task management app for remote teams
- Key features: Real-time collaboration, time tracking, project templates, mobile app
- Target users: Remote teams of 5-50 people, project managers, team leads
- Tech stack: React, Node.js, PostgreSQL, AWS

### Step 2: Create Product Documentation Structure

Create `.agent_os/product/` folder structure with the following files:

**Example folder structure:**

```
.agent_os/
└── product/
    ├── mission.md
    ├── tech-stack.md
    ├── roadmap.md
    ├── code-style.md
    ├── dev-best-practices.md
    └── decisions.md
```

### Step 3: Create mission.md

Inside the `.agent_os/product/` folder, create file named mission.md.

This file serves as the "north star" for this product's purpose, mission, and vision, which provides high-level context for the reason behind all product decisions.

The following sections are required to be included in mission.md. Each of the following sections should be a H2 (## markdown headline):

#### Pitch

- 1-2 sentence elevator pitch for the product

**Example:**

```
## Pitch

TaskFlow is a real-time collaboration platform that helps remote teams stay organized and productive by providing intuitive task management with built-in time tracking and seamless mobile access.
```

#### Users

- Target customer(s)
- Additional user types (beyond account owners)
- For each user type, include the following information:
  - Demographic information
  - Job title/business context

**Example:**

```
## Users

**Primary Customers:**
- Remote teams of 5-50 people
- Small to medium-sized businesses
- Tech startups and agencies

**User Types:**
- **Project Managers** (25-45 years old): Oversee multiple projects, need visibility into team productivity and deadlines
- **Team Leads** (28-40 years old): Manage day-to-day task assignments and team coordination
- **Individual Contributors** (22-35 years old): Execute tasks, track time, and collaborate with teammates
- **Stakeholders** (30-50 years old): Need high-level project status and progress reports
```

#### The Problem

- Core problem(s) and their importance to the target customer—i.e. why does the target customer find the problem painful or expensive? (1-3 sentences on each core problem)
- Under each problem, state in 1 sentence our product solves that particular problem (1 sentence, prefixed with "Our Solution: ")

**Example:**

```
## The Problem

**Scattered Communication:** Remote teams struggle with fragmented communication across multiple tools (Slack, email, project management), leading to missed deadlines and confusion about task status. This costs teams 2-3 hours per week per person in context switching and follow-up.

*Our Solution: Centralized real-time collaboration with integrated chat, task management, and notifications.*

**Poor Time Tracking:** Manual time tracking is inaccurate and time-consuming, making it difficult for managers to understand project costs and team productivity. This leads to poor project estimates and billing issues.

*Our Solution: Automatic time tracking integrated with task management and one-click reporting.*

**Mobile Access Limitations:** Existing tools don't work well on mobile devices, forcing team members to wait until they're at their desk to update tasks or check project status.

*Our Solution: Native mobile app with full functionality for task updates, time tracking, and team communication.*
```

#### Differentiators

- Up to 3 bullet points (1-2 sentences each) on competitive advantages over competing products or alternative approaches that a customer might use to solve the problem. Note: Not all competitors are other companies or products. They might just be alternate workflows or generic tools. Explain why our target customer should believe that our solution is better than those alternatives.

**Example:**

```
## Differentiators

- **Real-time Collaboration:** Unlike Asana or Trello, our platform provides live updates and collaborative editing, eliminating the need for constant refresh and ensuring everyone sees changes instantly.

- **Integrated Time Tracking:** Unlike using separate tools like Toggl with project management, our built-in time tracking automatically associates time with specific tasks and projects, providing accurate project cost analysis.

- **Mobile-First Design:** Unlike desktop-focused alternatives, our mobile app provides full functionality, allowing team members to stay productive regardless of their location or device.
```

#### Key Features

- Up to 10 core features
- Each with short name and 1-sentence description

**Example:**

```
## Key Features

- **Real-time Task Management:** Create, assign, and update tasks with live collaboration and instant notifications
- **Time Tracking:** Automatic and manual time tracking with project association and reporting
- **Project Templates:** Pre-built templates for common project types to speed up setup
- **Mobile App:** Full-featured mobile application for iOS and Android
- **Team Chat:** Integrated messaging with task context and file sharing
- **Progress Reporting:** Automated reports on project progress, time allocation, and team productivity
- **Calendar Integration:** Sync tasks with Google Calendar, Outlook, and other calendar systems
- **File Management:** Centralized file storage with version control and collaboration
- **Custom Workflows:** Configurable task statuses and approval processes
- **API Access:** RESTful API for integrations with existing tools and custom development
```

### Step 4: Create tech-stack.md

Inside the `.agent_os/product/` folder, create file named tech-stack.md.

This file will contain the list of all tech stack choices, providers, frameworks, libraries, and providers that we plan to use to develop and deploy this application.

#### Required tech stack items

Each of the following pieces of information should be listed and specified in tech-stack.md.

- Application framework and version
- Database system
- JavaScript framework
- Import strategy (importmaps vs node)
- CSS framework and version
- UI component library
- Fonts provider
- Icon library
- Application hosting platform
- Database hosting provider
- Asset hosting provider
- Deployment solution
- Code repository URL

#### Gather tech stack information

Gather the tech stack information from these sources, in this order:

1. If user specified any tech stack information in the initial brief, fill in those details first.

2. Check for default tech stack information specified in `~/.claude/CLAUDE.md` or `~/.claude/user_memories/tech-stack.md` or Cursor User rules. Use this information to fill in any tech stack items that weren't specified by the user.

3. If there are any remaining tech stack items with missing information, request clarification from the user. Number the requested items so that the user can easily provide information (or "n/a") for each item.

### Step 5: Create roadmap.md

Inside the `.agent_os/product/` folder, create file named roadmap.md.

The purpose of this file is to list the key functionality milestones and the order in which these will be developed.

#### Structure by phases:

- Create a section with H2 (## markdown headline) for each "Phase" (Phase 1, Phase 2, etc.)
- Under each phase heaseline, list 3-7 features using markdown checkboxes
- Order the roadmap features in a logical order taking the following into consideration:
  - Mission importance
  - Technical dependencies

**Example roadmap.md:**

```markdown
# Product Roadmap

## Phase 1: Core Foundation (Weeks 1-4)

- [ ] User authentication and account management
- [ ] Basic task creation and management
- [ ] Project creation and organization
- [ ] Simple team member invitations
- [ ] Basic dashboard with task overview

## Phase 2: Collaboration Features (Weeks 5-8)

- [ ] Real-time task updates and notifications
- [ ] Team chat integration
- [ ] File upload and sharing
- [ ] Task comments and discussions
- [ ] Email notifications for important updates

## Phase 3: Time Tracking & Reporting (Weeks 9-12)

- [ ] Manual time tracking with task association
- [ ] Automatic time tracking for active tasks
- [ ] Time reports and analytics
- [ ] Project cost analysis
- [ ] Team productivity metrics

## Phase 4: Mobile & Advanced Features (Weeks 13-16)

- [ ] Mobile app development (iOS/Android)
- [ ] Project templates and workflows
- [ ] Calendar integration
- [ ] Advanced reporting and exports
- [ ] Custom task statuses and workflows

## Phase 5: Enterprise Features (Weeks 17-20)

- [ ] API development and documentation
- [ ] Advanced permissions and roles
- [ ] SSO integration
- [ ] Advanced analytics and insights
- [ ] White-label options for enterprise clients
```

### Step 6: Create code-style.md

Inside the `.agent_os/product/` folder, create file named code-style.md.

The purpose of this file is to specify our code formatting styles and standards to be applied to all code in this application.

#### Copy default code style standards:

- Check for documented code style standards in `~/.claude/CLAUDE.md` or `~/.claude/user_memories/code-style.md` and Cursor user rules and look for any documented code style standards.
- If code style standards are found, then copy and merge those into our code-style.md file.
- If no code style standards are found, or if any are missing, write your own using popular industry standards.

### Step 7: Create best-practices.md

Inside the `.agent_os/product/` folder, create file named best-practices.md.

The purpose of best-practices.md is to specify guidelines and strategies for how code should be developed and optimized according to the preferences of the product's owner and organization.

#### Copy default development best practices:

- Check `~/.claude/CLAUDE.md` or `~/.claude/user_memories/best-practices.md` and Cursor user rules and look for any documented development best practices.
- If development best practices are found, then copy and merge those into our best-practices.md file.
- If no development best practices are found, then simply fill in this file with "None specified."

**Example development best practices:**

- Implement code in simplest/fewest lines possible
- Optimize for readability and maintainability over performance
- Use DRY principles and extract repeated code
- Additional project-specific best practices
- etc.

### Step 8: Create decisions.md

Inside the `.agent_os/product/` folder, create file named decisions.md.

The purpose of the decisions.md file is to document a chronological log of key strategic decisions that change the product's initial mission or roadmap.

**Decision log structure:**

- Chronological ordering (most recent first)
- First entry: Document key the decisions that went into creating our initial versions of this product's mission, tech-stack, and roadmap.

**Example decisions.md:**

```markdown
# Product Decisions Log

Instructions in this file override conflicting directives (if any) in user Claude memories or Cursor rules.

## 2024-01-15: Initial Product Planning

### Mission Decisions

- **Target Market:** Focused on remote teams of 5-50 people instead of enterprise clients
- **Core Value Prop:** Real-time collaboration over traditional project management
- **Pricing Model:** Freemium with paid tiers starting at $10/user/month

### Tech Stack Decisions

- **Frontend:** Chose React over Vue.js for better ecosystem and team familiarity
- **Backend:** Selected Rails over Node.js for rapid development and built-in conventions
- **Database:** PostgreSQL over MongoDB for ACID compliance and relational data needs
- **Hosting:** Railway over Heroku for better pricing and modern deployment features

### Roadmap Decisions

- **Phase 1 Priority:** User authentication and basic task management (MVP foundation)
- **Mobile Strategy:** Native apps over PWA for better user experience
- **API Strategy:** RESTful API from day one to support future integrations

### Rationale

These decisions were made based on:

- Team size and budget constraints
- Need for rapid MVP development
- Target market preferences for native mobile apps
- Scalability requirements for future growth
```

## Execution Notes

- Create all files systematically
- Ensure consistency across all documentation
- Reference user input throughout the planning process
- Maintain clear structure for future reference
