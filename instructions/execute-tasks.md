---
description:
globs:
alwaysApply: false
---

# Task Execution Rules

## Overview

This rule guides the execution of project tasks following a systematic development workflow from planning through deployment.

## Process Flow

### Step 1: Task Assignment

**USER provides:**

- Reference to project PRD file
- Specific parent task(s) to execute from tasks.md

**Default assumption:** Execute next uncompleted parent task and its sub-tasks

### Step 2: Context Analysis

Read all of the following files and think hard to gather all relevenat context for this task.

- Project PRD file
- Project tasks.md
- All files in project's specs/ folder
- Product mission.md for overall context

**Goal:** Complete understanding of project goals, requirements, and context

### Step 3: Implementation Planning

Create a detailed execution plan for this task(s).

Your plan should include:

- Numbered list with sub-bullet points
- Include all parts of current task that you plan to execute.
- Specify any 3rd party libraries/gems/integrations to install
- Display your plan to user and wait for approval

**Do not proceed until user responds to confirm your plan and give you affirmative permission to proceed.**

### Step 4: Check for Development Server Running

In order to ensure that you will have the ability to launch your own instance of a development server during your development process, we must ensure that there is not a development server already currently running.

- Check for running local server.
- If server is running, ask user if they want to shut it down and **wait for user's response before proceeding.**
- If no server is running, **then you can proceed immediately without requesting or waiting for approval from the user.**

### Step 5: Git Branch Management

#### Branch naming convention:

Use the branch creation logic below to see if we need to create a new branch for this task. If creating a new branch, then the branch name should match the project's name (excluding date)

- Example: If the project folder name is `YYYY-MM-DD-feature-name` then the branch name should be: `feature-name`

#### Branch creation logic:

There are 3 possible cases:

- Case A: If the current branch name is already the name of the project folder (excluding date), then we're already on the correct branch for this task and there is no need to create a new branch. **You can immediately proceed with your next step without asking or waiting for permission.**
- Case B: If the current branch name is `main`, `staging`, or `review` then create a new branch for this task. **Then you can immediately proceed with your next step without asking or waiting for permission.**
- Case C: If current branch is not `main`, `staging`, or `review`, and its name does not match this project's folder (excluding the date), then ask permission from USER to create new project branch (specify proposed name and current branch). **In this case, wait for user approval before proceeding**

### Step 6: Development Execution

Proceed with development of this task(s) by systematically adhering to all of the following:

- Follow the approved implementation plan exactly
- Adhere to all project specifications
- Follow `.agent/product/code-style.md` guidelines
- Follow `.agent/product/dev-best-practices.md` directives
- Implement test-driven development (TDD) approach

### Step 7: Task Status Updates

- After you complete each task or Read this project's tasks.md file
- As you complete each task and sub-task, immediately mark each of those items as completed with `[x]`
- Only mark items that are fully completed
- Update task status immediately after completion of each individual checklist item and sub-task.

#### Error handling

If you're blocked on a task and you've tried up to 3 approaches and still can't fully complete it or get a test to pass, then leave this task or sub-task as UNCHECKED with - [ ].

Underneath that item, describe the blocking issue with emoji ⚠️ and include this in your final recap.

### Step 8: Run all tests

Unless USER directed otherwise, after completing all parts of this task, and after the new tests you've written are confirmed to be 100% passing, now run ALL tests in our application's tests suite to ensure all of them still pass.

If any tests are failing, troubleshoot and fix those tests before moving on.

### Step 9: Git Workflow

Once you've completed all parts of the task(s), including ensuring all tests are passing, now you can proceed with commiting the work to git on the branch for this project and pushing your commit to GitHub and creating a GitHub Pull Request.

**Commit and deploy process:**

1. **Commit:** Create descriptive commit message for current work
2. **Push:** Push your commit to the GitHub repository
3. **Pull Request:** Create PR with descriptive title and description recapping built functionality

### Step 10: Roadmap Progress Check

Once all items have been completed, read `.agent/product/roadmap.md` and proceed with the following:

- Determine if project completion means roadmap items can be marked done
- Only mark roadmap items as complete if absolutely certain
- Update roadmap checkboxes accordingly

### Step 11: Task Completion Notification

Run the following so that an audio sound is played to alert the user that the task is complete.
`afplay /System/Library/Sounds/Glass.aiff`

### Step 12: Completion Summary

Write a concise and easily scannable message to recap the work you've just completed and display this to the user.

Your message should include:

**Built functionality recap:**

- Use a headline with ✅ emoji and text "What's been done"
- Itemize the main pieces you've built in a numbered list.
- Each item should have a short 1-sentence description.

**Issues encountered (if applicable):**

- If you were unable to fully complete any tasks or ran into errors or blockers, then include this section in your message.
- Give this section a headline with ⚠️ emoji and text "Issues encountered"
- Describe each issue and the reasons it couldn't be completed.

**Testing instructions (if applicable):**

- If any new functionality or user flow can be viewed and tested in a browser, then include this in your message.
- Give this a headline with 👀 emoji and text "Ready to test in browser"
- Provide numbered step-by-step instructions for the user to test each item manually.

**Pull Request information:**

- Use a headline with 📦 emoji and text "Pull Request"
- Provide the URL to view the Pull Request on GitHub

## Development Standards

- **Code Style:** Strictly follow `.agent/product/code-style.md`
- **Best Practices:** Adhere to `.agent/product/dev-best-practices.md`
- **Testing:** Implement comprehensive test coverage
- **Documentation:** Maintain clear commit messages and PR descriptions
- **Quality:** Ensure all functionality works as specified before marking complete

## Error Handling

- If development blocks occur, document in tasks.md
- Create new tasks for unresolved issues
- Never mark tasks complete if errors remain unresolved
- Seek user input for technical roadblocks
