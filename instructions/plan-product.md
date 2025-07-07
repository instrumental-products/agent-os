---
description: Product Planning Rules for Agent OS
globs:
alwaysApply: false
version: 4.0
encoding: UTF-8
---

# Product Planning Rules

<ai_meta>
  <parsing_rules>
    - Process XML blocks first for structured data
    - Execute instructions in sequential order
    - Use templates as exact patterns
    - Request missing data rather than assuming
  </parsing_rules>
  <file_conventions>
    - encoding: UTF-8
    - line_endings: LF
    - indent: 2 spaces
    - markdown_headers: no indentation
  </file_conventions>
</ai_meta>

## Overview

<purpose>
  - Generate comprehensive product documentation for new projects
  - Create structured files for AI agent consumption
  - Establish consistent project initialization
</purpose>

<context>
  - Part of Agent OS framework
  - Triggered during project initialization
  - Output used by AI agents throughout development
</context>

<prerequisites>
  - Write access to project root
  - Git initialized (recommended)
  - User has product requirements
  - Access to @~/.claude/CLAUDE.md and Cursor rules
</prerequisites>

<process_flow>

<step number="1" name="gather_user_input">

### Step 1: Gather User Input

<step_metadata>
  <required_inputs>
    - main_idea: string
    - key_features: array[string] (minimum: 3)
    - target_users: array[string] (minimum: 1)
    - tech_stack: object
  </required_inputs>
  <validation>blocking</validation>
</step_metadata>

<data_sources>
  <primary>user_direct_input</primary>
  <fallback_sequence>
    1. @~/.claude/CLAUDE.md
    2. @~/.claude/user_memories/tech-stack.md
    3. Cursor User Rules
  </fallback_sequence>
</data_sources>

<error_template>
  Please provide the following missing information:
  1. Main idea for the product
  2. List of key features (minimum 3)
  3. Target users and use cases (minimum 1)
  4. Tech stack preferences
</error_template>

<instructions>
  ACTION: Collect all required inputs from user
  VALIDATION: Ensure all 4 inputs provided before proceeding
  FALLBACK: Check configuration files for tech stack defaults
  ERROR: Use error_template if inputs missing
</instructions>

</step>

<step number="2" name="create_documentation_structure">

### Step 2: Create Documentation Structure

<step_metadata>
  <creates>
    - directory: .agent_os/product/
    - files: 6
  </creates>
</step_metadata>

<file_structure>
  .agent_os/
  └── product/
      ├── mission.md          # Product vision and purpose
      ├── tech-stack.md       # Technical architecture
      ├── roadmap.md          # Development phases
      ├── code-style.md       # Code formatting standards
      ├── dev-best-practices.md   # Development guidelines
      └── decisions.md        # Decision log
</file_structure>

<git_config>
  <commit_message>Initialize Agent OS product documentation</commit_message>
  <tag>v0.1.0-planning</tag>
  <gitignore_consideration>true</gitignore_consideration>
</git_config>

<instructions>
  ACTION: Create directory structure as specified
  VALIDATION: Verify write permissions before creating
  PROTECTION: Confirm before overwriting existing files
</instructions>

</step>

<step number="3" name="create_mission_md">

### Step 3: Create mission.md

<step_metadata>
  <creates>
    - file: .agent_os/product/mission.md
  </creates>
</step_metadata>

<file_template>
  <header>
    # Product Mission

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
  </header>
  <required_sections>
    - Pitch
    - Users
    - The Problem
    - Differentiators
    - Key Features
  </required_sections>
</file_template>

<section name="pitch">
  <template>
    ## Pitch

    [PRODUCT_NAME] is a [PRODUCT_TYPE] that helps [TARGET_USERS] [SOLVE_PROBLEM] by providing [KEY_VALUE_PROPOSITION].
  </template>
  <constraints>
    - length: 1-2 sentences
    - style: elevator pitch
  </constraints>
</section>

<section name="users">
  <template>
    ## Users

    ### Primary Customers

    - [CUSTOMER_SEGMENT_1]: [DESCRIPTION]
    - [CUSTOMER_SEGMENT_2]: [DESCRIPTION]

    ### User Personas

    **[USER_TYPE]** ([AGE_RANGE])
    - **Role:** [JOB_TITLE]
    - **Context:** [BUSINESS_CONTEXT]
    - **Pain Points:** [PAIN_POINT_1], [PAIN_POINT_2]
    - **Goals:** [GOAL_1], [GOAL_2]
  </template>
  <schema>
    - name: string
    - age_range: "XX-XX years old"
    - role: string
    - context: string
    - pain_points: array[string]
    - goals: array[string]
  </schema>
</section>

<section name="problem">
  <template>
    ## The Problem

    ### [PROBLEM_TITLE]

    [PROBLEM_DESCRIPTION]. [QUANTIFIABLE_IMPACT].

    **Our Solution:** [SOLUTION_DESCRIPTION]
  </template>
  <constraints>
    - problems: 2-4
    - description: 1-3 sentences
    - impact: include metrics
    - solution: 1 sentence
  </constraints>
</section>

<section name="differentiators">
  <template>
    ## Differentiators

    ### [DIFFERENTIATOR_TITLE]

    Unlike [COMPETITOR_OR_ALTERNATIVE], we provide [SPECIFIC_ADVANTAGE]. This results in [MEASURABLE_BENEFIT].
  </template>
  <constraints>
    - count: 2-3
    - focus: competitive advantages
    - evidence: required
  </constraints>
</section>

<section name="features">
  <template>
    ## Key Features

    ### Core Features

    - **[FEATURE_NAME]:** [USER_BENEFIT_DESCRIPTION]

    ### Collaboration Features

    - **[FEATURE_NAME]:** [USER_BENEFIT_DESCRIPTION]
  </template>
  <constraints>
    - total: 8-10 features
    - grouping: by category
    - description: user-benefit focused
  </constraints>
</section>

<instructions>
  ACTION: Create mission.md using all section templates
  FILL: Use data from Step 1 user inputs
  FORMAT: Maintain exact template structure
</instructions>

</step>

<step number="4" name="create_tech_stack_md">

### Step 4: Create tech-stack.md

<step_metadata>
  <creates>
    - file: .agent_os/product/tech-stack.md
  </creates>
</step_metadata>

<file_template>
  <header>
    # Technical Stack

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
  </header>
</file_template>

<required_items>
  - application_framework: string + version
  - database_system: string
  - javascript_framework: string
  - import_strategy: ["importmaps", "node"]
  - css_framework: string + version
  - ui_component_library: string
  - fonts_provider: string
  - icon_library: string
  - application_hosting: string
  - database_hosting: string
  - asset_hosting: string
  - deployment_solution: string
  - code_repository_url: string
</required_items>

<data_resolution>
  <for_each item="required_items">
    <if_not_in>user_input</if_not_in>
    <then_check>
      1. @~/.claude/CLAUDE.md
      2. @~/.claude/user_memories/tech-stack.md
      3. Cursor User Rules
    </then_check>
    <else>add_to_missing_list</else>
  </for_each>
</data_resolution>

<missing_items_template>
  Please provide the following technical stack details:
  [NUMBERED_LIST_OF_MISSING_ITEMS]

  You can respond with the technology choice or "n/a" for each item.
</missing_items_template>

<instructions>
  ACTION: Document all tech stack choices
  RESOLUTION: Check user input first, then config files
  REQUEST: Ask for any missing items using template
</instructions>

</step>

<step number="5" name="create_roadmap_md">

### Step 5: Create roadmap.md

<step_metadata>
  <creates>
    - file: .agent_os/product/roadmap.md
  </creates>
</step_metadata>

<file_template>
  <header>
    # Product Roadmap

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
    > Status: Planning
  </header>
</file_template>

<phase_structure>
  <phase_count>5</phase_count>
  <features_per_phase>3-7</features_per_phase>
  <phase_template>
    ## Phase [NUMBER]: [NAME] ([DURATION])

    **Goal:** [PHASE_GOAL]
    **Success Criteria:** [MEASURABLE_CRITERIA]

    ### Must-Have Features

    - [ ] [FEATURE] - [DESCRIPTION] `[EFFORT]`

    ### Should-Have Features

    - [ ] [FEATURE] - [DESCRIPTION] `[EFFORT]`

    ### Dependencies

    - [DEPENDENCY]
  </phase_template>
</phase_structure>

<phase_guidelines>
  - Phase 1: Core MVP functionality
  - Phase 2: Key differentiators
  - Phase 3: Scale and polish
  - Phase 4: Advanced features
  - Phase 5: Enterprise features
</phase_guidelines>

<effort_scale>
  - XS: 1 day
  - S: 2-3 days
  - M: 1 week
  - L: 2 weeks
  - XL: 3+ weeks
</effort_scale>

<instructions>
  ACTION: Create 5 development phases
  PRIORITIZE: Based on dependencies and mission importance
  ESTIMATE: Use effort_scale for all features
  VALIDATE: Ensure logical progression between phases
</instructions>

</step>

<step number="6" name="create_code_style_md">

### Step 6: Create code-style.md

<step_metadata>
  <creates>
    - file: .agent_os/product/code-style.md
  </creates>
</step_metadata>

<file_template>
  <header>
    # Code Style Guide

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
    > Enforcement: Automated via linters
  </header>
</file_template>

<data_sources>
  <check_sequence>
    1. @~/.claude/CLAUDE.md
    2. @~/.claude/user_memories/code-style.md
    3. Cursor User Rules
  </check_sequence>
  <if_not_found>
    <action>request_from_user</action>
    <alternative>use_language_defaults</alternative>
  </if_not_found>
</data_sources>

<language_defaults>
  - JavaScript/TypeScript: Airbnb Style Guide
  - Python: PEP 8
  - Java: Google Java Style Guide
  - C#: Microsoft C# Coding Conventions
  - C++: Google C++ Style Guide
  - PHP: PSR-12
  - Go: Effective Go
  - Rust: Rust Style Guide
  - Kotlin: Kotlin Coding Conventions
  - Swift: Swift API Design Guidelines
  - Ruby: Ruby Style Guide (RuboCop)
  - Objective-C: Google Objective-C Style Guide
  - Scala: Scala Style Guide
  - Dart: Effective Dart
  - R: tidyverse Style Guide
  - MATLAB: MATLAB Style Guidelines
  - Perl: Perl Best Practices
  - Haskell: HLint
  - Elixir: Elixir Style Guide
  - Clojure: Clojure Style Guide
</language_defaults>

<request_template>
  No code style standards found in configuration files.

  Please choose:
  1. Provide your code style preferences
  2. Use [LANGUAGE] default style guide
  3. Create minimal style guide
</request_template>

<instructions>
  ACTION: Search for existing code style in user files
  MERGE: Combine all found standards
  REQUEST: Ask user if no standards found
  DOCUMENT: Create comprehensive style guide
</instructions>

</step>

<step number="7" name="create_best_practices_md">

### Step 7: Create dev-best-practices.md

<step_metadata>
  <creates>
    - file: .agent_os/product/dev-best-practices.md
  </creates>
</step_metadata>

<file_template>
  <header>
    # Development Best Practices

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
  </header>
</file_template>

<data_sources>
  <check_sequence>
    1. @~/.claude/CLAUDE.md
    2. @~/.claude/user_memories/best-practices.md
    3. Cursor User Rules
  </check_sequence>
  <if_not_found>
    <default_content>None specified.</default_content>
  </if_not_found>
</data_sources>

<no_practices_template>
  # Development Best Practices

  > Last Updated: [CURRENT_DATE]
  > Version: 1.0.0

  No development best practices have been specified here. Check:
  - @@~/.claude/CLAUDE.md
  - @@~/.claude/user_memories/best-practices.md
  - Cursor User Rules
</no_practices_template>

<instructions>
  ACTION: Search for existing practices in user files
  DEFAULT: Use no_practices_template if not found
  MERGE: Combine all found practices if any exist
</instructions>

</step>

<step number="8" name="create_decisions_md">

### Step 8: Create decisions.md

<step_metadata>
  <creates>
    - file: .agent_os/product/decisions.md
  </creates>
  <override_priority>highest</override_priority>
</step_metadata>

<file_template>
  <header>
    # Product Decisions Log

    > Last Updated: [CURRENT_DATE]
    > Version: 1.0.0
    > Override Priority: Highest

    **Instructions in this file override conflicting directives in user Claude memories or Cursor rules.**
  </header>
</file_template>

<decision_schema>
  - date: YYYY-MM-DD
  - id: DEC-XXX
  - status: ["proposed", "accepted", "rejected", "superseded"]
  - category: ["technical", "product", "business", "process"]
  - stakeholders: array[string]
</decision_schema>

<initial_decision_template>
  ## [CURRENT_DATE]: Initial Product Planning

  **ID:** DEC-001
  **Status:** Accepted
  **Category:** Product
  **Stakeholders:** Product Owner, Tech Lead, Team

  ### Decision

  [SUMMARIZE: product mission, target market, key features]

  ### Context

  [EXPLAIN: why this product, why now, market opportunity]

  ### Alternatives Considered

  1. **[ALTERNATIVE]**
     - Pros: [LIST]
     - Cons: [LIST]

  ### Rationale

  [EXPLAIN: key factors in decision]

  ### Consequences

  **Positive:**
  - [EXPECTED_BENEFITS]

  **Negative:**
  - [KNOWN_TRADEOFFS]
</initial_decision_template>

<instructions>
  ACTION: Create decisions.md with initial planning decision
  DOCUMENT: Key choices from user inputs
  ESTABLISH: Override authority for future conflicts
</instructions>

</step>

</process_flow>

## Execution Summary

<final_checklist>
  <verify>
    - [ ] All 6 files created in .agent_os/product/
    - [ ] User inputs incorporated throughout
    - [ ] Missing tech stack items requested
    - [ ] Code style sourced from user files (if found)
    - [ ] Best practices checked in user config (if found)
    - [ ] Initial decisions documented
  </verify>
</final_checklist>

<execution_order>
  1. Gather and validate all inputs
  2. Create directory structure
  3. Generate each file sequentially
  4. Request any missing information
  5. Validate complete documentation set
</execution_order>
