---
description: Product Planning Rules for Agent OS
globs:
alwaysApply: false
version: 2.1
---

# Product Planning Rules

<ai_instructions>
  - Always create folders before files
  - Use exact filenames as specified
  - Preserve all markdown formatting in generated files
  - Do not abbreviate or summarize examples
  - Follow the exact sequence of steps
  - Validate all inputs before proceeding
</ai_instructions>

<indentation_rules>
  1. XML tags: Always at column 0 (no indentation)
  2. XML tag content: 2-space indent from parent tag
  3. Markdown headers: No indentation, even inside XML tags
  4. Markdown lists: Use standard Markdown indentation (2 or 4 spaces)
  5. Code blocks: Preserve their internal indentation
  6. YAML/JSON blocks: Preserve their required indentation
</indentation_rules>

## Overview

This rule guides the creation of a comprehensive product plan including mission, tech stack, roadmap, and development standards.

<process_flow>

<step number="1" name="gather_user_input">

### Step 1: Gather User Input

<inputs>
  - main_idea: string (required)
  - key_features: array (required)
  - target_users: array (required)
  - tech_stack: object (required)
</inputs>

<validation>
  <requirement priority="high" blocking="true">
    All 4 user inputs must be provided before proceeding
  </requirement>
</validation>

USER provides the following information:

- The main idea for this product
- List of key features
- Target users and their use case(s) for this product
- Tech stack to be used for the development and deployment of this product

<decision_tree>
  IF tech_stack_not_provided:
    CHECK ~/.claude/CLAUDE.md
    CHECK ~/.claude/user_memories/tech-stack.md
    CHECK Cursor User Rules
    IF tech_stack_found:
      USE found_tech_stack as default
    ELSE:
      REQUEST tech_stack_from_user
</decision_tree>

<error_handling>
  <case type="missing_input">
    ACTION: Request specific missing fields
    FORMAT: Numbered list
    EXAMPLE: "Please provide the following missing information:
             1. Main idea for the product
             2. List of key features"
  </case>
</error_handling>

<template name="user_input_example">
  **Example user input:**

  - Main idea: A task management app for remote teams
  - Key features: Real-time collaboration, time tracking, project templates, mobile app
  - Target users: Remote teams of 5-50 people, project managers, team leads
  - Tech stack: React, Node.js, PostgreSQL, AWS
</template>

<checkpoint name="post_step_1">
  VERIFY:
    - [ ] Main idea documented
    - [ ] Key features listed
    - [ ] Target users identified
    - [ ] Tech stack resolved
</checkpoint>

</step>

<step number="2" name="create_documentation_structure">

### Step 2: Create Product Documentation Structure

<outputs>
  - folder: .agent_os/product/
  - files: 6 markdown files
</outputs>

<file_paths>
  base_dir: .agent_os/product/
  files:
    - ${base_dir}/mission.md
    - ${base_dir}/tech-stack.md
    - ${base_dir}/roadmap.md
    - ${base_dir}/code-style.md
    - ${base_dir}/dev-best-practices.md
    - ${base_dir}/decisions.md
</file_paths>

Create `.agent_os/product/` folder structure with the following files:

<template name="folder_structure">
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
</template>

<git_instructions>
  - Create .agent_os/ in project root
  - Consider adding to .gitignore if contains sensitive information
  - Commit message: "Initialize Agent OS product documentation"
</git_instructions>

</step>

<step number="3" name="create_mission_md">

### Step 3: Create mission.md

<outputs>
  - file: .agent_os/product/mission.md
</outputs>

Inside the `.agent_os/product/` folder, create file named mission.md.

This file serves as the "north star" for this product's purpose, mission, and vision, which provides high-level context for the reason behind all product decisions.

<required_sections>
  - Pitch (H2)
  - Users (H2)
  - The Problem (H2)
  - Differentiators (H2)
  - Key Features (H2)
</required_sections>

#### Pitch

<template name="mission_pitch">
  ## Pitch

  [PRODUCT_NAME] is a [PRODUCT_TYPE] that helps [TARGET_USERS] [SOLVE_PROBLEM] by providing [KEY_VALUE_PROP].
</template>

- 1-2 sentence elevator pitch for the product

<example>
  ```markdown
  ## Pitch

  TaskFlow is a real-time collaboration platform that helps remote teams stay organized and productive by providing intuitive task management with built-in time tracking and seamless mobile access.
  ```
</example>

#### Users

<user_type_schema>
  name: string
  age_range: string (format: "XX-XX years old")
  job_title: string
  business_context: string
  demographic_info: string
</user_type_schema>

- Target customer(s)
- Additional user types (beyond account owners)
- For each user type, include the following information:
  - Demographic information
  - Job title/business context

<template name="mission_users">
  ## Users

  **Primary Customers:**
  - [CUSTOMER_TYPE_1]
  - [CUSTOMER_TYPE_2]
  - [CUSTOMER_TYPE_3]

  **User Types:**
  - **[USER_TYPE_1]** ([AGE_RANGE]): [JOB_CONTEXT_AND_NEEDS]
  - **[USER_TYPE_2]** ([AGE_RANGE]): [JOB_CONTEXT_AND_NEEDS]
  - **[USER_TYPE_3]** ([AGE_RANGE]): [JOB_CONTEXT_AND_NEEDS]
  - **[USER_TYPE_4]** ([AGE_RANGE]): [JOB_CONTEXT_AND_NEEDS]
</template>

<example>
  ```markdown
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
</example>

#### The Problem

<problem_schema>
  problem_title: string
  problem_description: string (1-3 sentences)
  impact: string (why painful/expensive)
  solution: string (1 sentence, prefixed with "Our Solution: ")
</problem_schema>

- Core problem(s) and their importance to the target customer—i.e. why does the target customer find the problem painful or expensive? (1-3 sentences on each core problem)
- Under each problem, state in 1 sentence our product solves that particular problem (1 sentence, prefixed with "Our Solution: ")

<template name="mission_problems">
  ## The Problem

  **[PROBLEM_1_TITLE]:** [PROBLEM_1_DESCRIPTION] [IMPACT_STATEMENT]

  *Our Solution: [SOLUTION_1]*

  **[PROBLEM_2_TITLE]:** [PROBLEM_2_DESCRIPTION] [IMPACT_STATEMENT]

  *Our Solution: [SOLUTION_2]*

  **[PROBLEM_3_TITLE]:** [PROBLEM_3_DESCRIPTION] [IMPACT_STATEMENT]

  *Our Solution: [SOLUTION_3]*
</template>

<example>
  ```markdown
  ## The Problem

  **Scattered Communication:** Remote teams struggle with fragmented communication across multiple tools (Slack, email, project management), leading to missed deadlines and confusion about task status. This costs teams 2-3 hours per week per person in context switching and follow-up.

  *Our Solution: Centralized real-time collaboration with integrated chat, task management, and notifications.*

  **Poor Time Tracking:** Manual time tracking is inaccurate and time-consuming, making it difficult for managers to understand project costs and team productivity. This leads to poor project estimates and billing issues.

  *Our Solution: Automatic time tracking integrated with task management and one-click reporting.*

  **Mobile Access Limitations:** Existing tools don't work well on mobile devices, forcing team members to wait until they're at their desk to update tasks or check project status.

  *Our Solution: Native mobile app with full functionality for task updates, time tracking, and team communication.*
  ```
</example>

#### Differentiators

- Up to 3 bullet points (1-2 sentences each) on competitive advantages over competing products or alternative approaches that a customer might use to solve the problem. Note: Not all competitors are other companies or products. They might just be alternate workflows or generic tools. Explain why our target customer should believe that our solution is better than those alternatives.

<template name="mission_differentiators">
  ## Differentiators

  - **[DIFFERENTIATOR_1_TITLE]:** [COMPARISON_TO_ALTERNATIVES] [WHY_BETTER]

  - **[DIFFERENTIATOR_2_TITLE]:** [COMPARISON_TO_ALTERNATIVES] [WHY_BETTER]

  - **[DIFFERENTIATOR_3_TITLE]:** [COMPARISON_TO_ALTERNATIVES] [WHY_BETTER]
</template>

<example>
  ```markdown
  ## Differentiators

  - **Real-time Collaboration:** Unlike Asana or Trello, our platform provides live updates and collaborative editing, eliminating the need for constant refresh and ensuring everyone sees changes instantly.

  - **Integrated Time Tracking:** Unlike using separate tools like Toggl with project management, our built-in time tracking automatically associates time with specific tasks and projects, providing accurate project cost analysis.

  - **Mobile-First Design:** Unlike desktop-focused alternatives, our mobile app provides full functionality, allowing team members to stay productive regardless of their location or device.
  ```
</example>

#### Key Features

<feature_schema>
  feature_name: string (short)
  feature_description: string (1 sentence)
  max_features: 10
</feature_schema>

- Up to 10 core features
- Each with short name and 1-sentence description

<template name="mission_features">
  ## Key Features

  - **[FEATURE_1_NAME]:** [FEATURE_1_DESCRIPTION]
  - **[FEATURE_2_NAME]:** [FEATURE_2_DESCRIPTION]
  - **[FEATURE_3_NAME]:** [FEATURE_3_DESCRIPTION]
  - **[FEATURE_4_NAME]:** [FEATURE_4_DESCRIPTION]
  - **[FEATURE_5_NAME]:** [FEATURE_5_DESCRIPTION]
  - **[FEATURE_6_NAME]:** [FEATURE_6_DESCRIPTION]
  - **[FEATURE_7_NAME]:** [FEATURE_7_DESCRIPTION]
  - **[FEATURE_8_NAME]:** [FEATURE_8_DESCRIPTION]
  - **[FEATURE_9_NAME]:** [FEATURE_9_DESCRIPTION]
  - **[FEATURE_10_NAME]:** [FEATURE_10_DESCRIPTION]
</template>

<example>
  ```markdown
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
</example>

</step>

<step number="4" name="create_tech_stack_md">

### Step 4: Create tech-stack.md

<outputs>
  - file: .agent_os/product/tech-stack.md
</outputs>

Inside the `.agent_os/product/` folder, create file named tech-stack.md.

This file will contain the list of all tech stack choices, providers, frameworks, libraries, and providers that we plan to use to develop and deploy this application.

#### Required tech stack items

<tech_stack_schema>
  application_framework: string (with version)
  database_system: string
  javascript_framework: string
  import_strategy: enum ["importmaps", "node"]
  css_framework: string (with version)
  ui_component_library: string
  fonts_provider: string
  icon_library: string
  application_hosting: string
  database_hosting: string
  asset_hosting: string
  deployment_solution: string
  code_repository_url: string
</tech_stack_schema>

Each of the following pieces of information should be listed and specified in tech-stack.md:

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

<decision_tree>
  FOREACH tech_stack_item:
    IF item_specified_by_user:
      USE user_specified_value
    ELSE IF item_in_claude_md:
      USE claude_md_value
    ELSE IF item_in_user_memories:
      USE user_memories_value
    ELSE IF item_in_cursor_rules:
      USE cursor_rules_value
    ELSE:
      ADD_TO missing_items_list
  IF missing_items_list_not_empty:
    REQUEST missing_items_from_user
</decision_tree>

Gather the tech stack information from these sources, in this order:

1. If user specified any tech stack information in the initial brief, fill in those details first.

2. Check for default tech stack information specified in `~/.claude/CLAUDE.md` or `~/.claude/user_memories/tech-stack.md` or Cursor User rules. Use this information to fill in any tech stack items that weren't specified by the user.

3. If there are any remaining tech stack items with missing information, request clarification from the user. Number the requested items so that the user can easily provide information (or "n/a") for each item.

<see_also>
  - ref: ~/.claude/CLAUDE.md
  - ref: ~/.claude/user_memories/tech-stack.md
  - ref: Cursor User Rules
</see_also>

</step>

<step number="5" name="create_roadmap_md">

### Step 5: Create roadmap.md

<outputs>
  - file: .agent_os/product/roadmap.md
</outputs>

Inside the `.agent_os/product/` folder, create file named roadmap.md.

The purpose of this file is to list the key functionality milestones and the order in which these will be developed.

<roadmap_schema>
  phase_name: string (format: "Phase X: [Title] ([Timeline])")
  features_per_phase: number (min: 3, max: 7)
  feature_format: checkbox (markdown)
  ordering_criteria:
    - mission_importance
    - technical_dependencies
</roadmap_schema>

#### Structure by phases:

- Create a section with H2 (## markdown headline) for each "Phase" (Phase 1, Phase 2, etc.)
- Under each phase headline, list 3-7 features using markdown checkboxes
- Order the roadmap features in a logical order taking the following into consideration:
  - Mission importance
  - Technical dependencies

<template name="roadmap_structure">
  # Product Roadmap

  ## Phase 1: [PHASE_TITLE] ([TIMELINE])

  - [ ] [FEATURE_1]
  - [ ] [FEATURE_2]
  - [ ] [FEATURE_3]
  - [ ] [FEATURE_4]
  - [ ] [FEATURE_5]

  ## Phase 2: [PHASE_TITLE] ([TIMELINE])

  - [ ] [FEATURE_1]
  - [ ] [FEATURE_2]
  - [ ] [FEATURE_3]
  - [ ] [FEATURE_4]
</template>

<example>
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
</example>

</step>

<step number="6" name="create_code_style_md">

### Step 6: Create code-style.md

<outputs>
  - file: .agent_os/product/code-style.md
</outputs>

Inside the `.agent_os/product/` folder, create file named code-style.md.

The purpose of this file is to specify our code formatting styles and standards to be applied to all code in this application.

#### Copy default code style standards:

<decision_tree>
  CHECK ~/.claude/CLAUDE.md FOR code_style_standards
  CHECK ~/.claude/user_memories/code-style.md FOR code_style_standards
  CHECK Cursor_user_rules FOR code_style_standards

  IF standards_found:
    MERGE all_found_standards INTO code-style.md
  ELSE:
    WRITE industry_standard_code_styles
</decision_tree>

- Check for documented code style standards in `~/.claude/CLAUDE.md` or `~/.claude/user_memories/code-style.md` and Cursor user rules and look for any documented code style standards.
- If code style standards are found, then copy and merge those into our code-style.md file.
- If no code style standards are found, or if any are missing, write your own using popular industry standards.

<see_also>
  - ref: ~/.claude/CLAUDE.md
  - ref: ~/.claude/user_memories/code-style.md
  - ref: Cursor User Rules
</see_also>

</step>

<step number="7" name="create_best_practices_md">

### Step 7: Create best-practices.md

<outputs>
  - file: .agent_os/product/dev-best-practices.md
</outputs>

Inside the `.agent_os/product/` folder, create file named best-practices.md.

The purpose of best-practices.md is to specify guidelines and strategies for how code should be developed and optimized according to the preferences of the product's owner and organization.

#### Copy default development best practices:

<decision_tree>
  CHECK ~/.claude/CLAUDE.md FOR best_practices
  CHECK ~/.claude/user_memories/best-practices.md FOR best_practices
  CHECK Cursor_user_rules FOR best_practices

  IF best_practices_found:
    MERGE all_found_practices INTO best-practices.md
  ELSE:
    WRITE "None specified."
</decision_tree>

- Check `~/.claude/CLAUDE.md` or `~/.claude/user_memories/best-practices.md` and Cursor user rules and look for any documented development best practices.
- If development best practices are found, then copy and merge those into our best-practices.md file.
- If no development best practices are found, then simply fill in this file with "None specified."

<template name="best_practices_example">
  **Example development best practices:**

  - Implement code in simplest/fewest lines possible
  - Optimize for readability and maintainability over performance
  - Use DRY principles and extract repeated code
  - Additional project-specific best practices
  - etc.
</template>

<see_also>
  - ref: ~/.claude/CLAUDE.md
  - ref: ~/.claude/user_memories/best-practices.md
  - ref: Cursor User Rules
</see_also>

</step>

<step number="8" name="create_decisions_md">

### Step 8: Create decisions.md

<outputs>
  - file: .agent_os/product/decisions.md
</outputs>

Inside the `.agent_os/product/` folder, create file named decisions.md.

The purpose of the decisions.md file is to document a chronological log of key strategic decisions that change the product's initial mission or roadmap.

<decision_log_schema>
  date: ISO-8601 (YYYY-MM-DD)
  ordering: chronological_descending (most recent first)
  first_entry: initial_planning_decisions
  override_priority: highest (overrides Claude memories and Cursor rules)
</decision_log_schema>

**Decision log structure:**

- Chronological ordering (most recent first)
- First entry: Document key the decisions that went into creating our initial versions of this product's mission, tech-stack, and roadmap.

<template name="decisions_structure">
  # Product Decisions Log

  Instructions in this file override conflicting directives (if any) in user Claude memories or Cursor rules.

  ## [DATE]: [DECISION_TITLE]

  ### [CATEGORY] Decisions

  - **[DECISION_TOPIC]:** [DECISION_MADE] over [ALTERNATIVE_CONSIDERED]
  - **[DECISION_TOPIC]:** [DECISION_MADE] for [REASON]
  - **[DECISION_TOPIC]:** [DECISION_MADE] based on [CRITERIA]

  ### Rationale

  These decisions were made based on:

  - [RATIONALE_POINT_1]
  - [RATIONALE_POINT_2]
  - [RATIONALE_POINT_3]
  - [RATIONALE_POINT_4]
</template>

<example>
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
</example>

</step>

</process_flow>

## Execution Notes

<execution_guidelines>
  - Create all files systematically in the specified order
  - Ensure consistency across all documentation
  - Reference user input throughout the planning process
  - Maintain clear structure for future reference
  - Validate each step before proceeding to the next
  - Use exact file names and paths as specified
</execution_guidelines>

<checkpoint name="final_validation">
  VERIFY:
    - [ ] All 6 files created in .agent_os/product/
    - [ ] User input incorporated throughout
    - [ ] Tech stack fully specified
    - [ ] Roadmap logically ordered
    - [ ] Initial decisions documented
</checkpoint>
