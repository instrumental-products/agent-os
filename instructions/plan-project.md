---
description:
globs:
alwaysApply: false
---

# Project Planning Rules

## Overview

This rule guides the creation of a detailed project plan for implementing a specific feature, component, or improvement within the broader product roadmap.

## Process Flow

### Step 1: Project Initiation

USER initiates a new project in one of two ways:

**Option A:** User asks "what's next?" or "what should we work on next?"

- AGENT checks `.agent_os/product/roadmap.md`
- Find next uncompleted roadmap item
- Suggest that item as the next project
- Wait for user approval

**Option B:** USER describes a specific project idea and provides some high-level goals and specific requirements. These may come in any form, length, or organizational detail.

### Step 2: Context Gathering

AGENT reads and analyzes the following:

Be sure think hard when adding the following content to your context:

1. `.agent_os/product/mission.md` - Understand overall product vision
2. `.agent_os/product/roadmap.md` - Current progress and future plans
3. `.agent_os/product/tech-stack.md` - Technical alignment requirements

### Step 3: Requirements Clarification

The following pieces of information are needed before we can proceed:

- The scope boundaries: What is in scope?
  - Optional: What are some items we specificy as "out of scope"?
- Technical considerations: Ensure there are not any ambiguities when it comes to how specific functionality, UI or UX should work.

Based on USER's initiation prompt and/or the product roadmap item details, AGENT decides whether or not there is a need to ask for clarification or not. If yes, then ask the user specific questions aimed at gathering the clarifications needed. Number your questions so that it's easy for the user to respond to each.

### Step 4: Project Folder Creation

Create project folder: `.agent_os/projects/YYYY-MM-DD-project-name/`

- Start the folder name with today's date formatted as YYYY-MM-DD
- Complete the folder name with a short descriptive project name of up to 5 words max.

### Step 5: Create project.md (Project Requirements Document)

Create this file inside of the project folder you created for this project.

The following sections are required to be included in project.md. Each of the following sections should be a H2 (## markdown headline):

#### Overview

- 1-2 sentences describing the goal and objective for this project.

**Example Overivew:**
Implement a secure password reset functionality that allows users to regain account access through email verification. This feature will reduce support ticket volume and improve user experience by providing self-service account recovery.

#### User Stories

- 1-3 most important user stories
- Include user workflow and problem being solved
- Give each user story a short title for easy scannability.

**Example User Story:**

**Password Reset Flow**
As a user, I want to be able to reset my password when I forget it, so that I can regain access to my account without contacting support. When I click "Forgot Password" on the login page, I should receive an email with a secure reset link that expires in 1 hour. After clicking the link, I can enter a new password and immediately log in with the new credentials.

#### Project Scope

- 1-5 specific features/functionalities to build
- Short name and 1-sentence description each

**Example Project Scope:**

1. **Password Reset Email** - Send secure reset link via email with 1-hour expiration
2. **Reset Token Validation** - Verify reset tokens and prevent reuse after password change
3. **New Password Form** - Allow users to enter and confirm new password with validation
4. **Password Update** - Securely update user password and invalidate all existing sessions
5. **Success Feedback** - Display confirmation message and redirect to login page

#### Out of Scope

- List functionalities explicitly excluded from this project

**Example Out of Scope:**

- SMS-based password reset (email only for this iteration)
- Password strength requirements beyond basic validation
- Integration with external identity providers
- Password history tracking to prevent reuse
- Account lockout after failed attempts

#### Expected Deliverable

- 1-3 expectations for what user can test in browser post-completion

**Example Expected Deliverable:**

1. User can click "Forgot Password" on login page and receive reset email within 2 minutes
2. User can click reset link in email and successfully change password with confirmation
3. User can immediately log in with new password and old password is no longer valid

### Step 6: specs/technical-spec.md

Inside the project folder you created for this project, create the `specs/` folder and inside it, create `technical-spec.md`.

At the top of this file, include 1-sentence paragraph that says:

"This is the technical specification for the project detailed in @.agent_os/projects/YYYY-MM-DD-project-name/project.md" (replace the project folder name with the actual project folder name you created for this project).

The `technical-spec.md` file should contain detailed technical requirements for this project. The goal of this file is to fill in all knowledge gaps and technical questions that may arise while implementing the functionality and UI for this project.

These may include any of the following:

- Technical, functional, UI/UX requirements
- Multiple approach options (if applicable) with selected approach and rationale
- Required new external libraries/gems/integrations with justifications

**Example Technical Requirements:**

- Use Rails' built-in `has_secure_password` for password hashing and validation
- Implement token-based reset using SecureRandom.hex(32) with 1-hour expiration
- Store reset tokens in separate `password_resets` table with user_id and expires_at
- Use ActionMailer with background job processing for email delivery
- Implement CSRF protection on all password reset forms
- Use Turbo for seamless form submissions without page reloads

**Example Approach Options:**

- **Option A:** Store reset tokens in User model (simpler but less secure)
- **Option B:** Separate PasswordReset model with automatic cleanup (selected - better security)
- **Rationale:** Separate model allows for better token management, audit trail, and automatic cleanup of expired tokens

**Example External Dependencies:**

- **Sidekiq** - For background email processing to prevent timeout issues
- **Redis** - Required by Sidekiq for job queue management
- **Justification:** Email delivery can take 2-5 seconds, which would cause request timeouts without background processing

### Step 7: Create specs/database-schema.md

Only do this step if this project includes any changes, additions, or modifications to any database tables. If not, then skip this step.

Inside of this project folder and inside the `specs/` folder, create the file `database-schema.md`.

At the top of this file, include 1-sentence paragraph that says:

"This is the database schema implementation for the project detailed in @.agent_os/projects/YYYY-MM-DD-project-name/project.md" (replace the project folder name with the actual project folder name you created for this project).

The database-schema.md file may include any of the following (whichever items are applicatable):

- New tables, columns, or schema modifications
- Exact change specifications
- Descriptions of each change and rationale

**Example Database Schema:**

```sql
-- New table: password_resets
CREATE TABLE password_resets (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  token VARCHAR(64) NOT NULL UNIQUE,
  expires_at TIMESTAMP NOT NULL,
  used_at TIMESTAMP NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Index for performance
CREATE INDEX idx_password_resets_token ON password_resets(token);
CREATE INDEX idx_password_resets_user_id ON password_resets(user_id);
CREATE INDEX idx_password_resets_expires_at ON password_resets(expires_at);
```

**Example Change Specifications:**

- **Table:** `password_resets` (new)
- **Purpose:** Store password reset tokens separately from user data for security
- **Columns:** user_id (FK), token (unique), expires_at, used_at, timestamps
- **Rationale:** Separate table allows for better token lifecycle management and audit trail

### Step 8: Create specs/api-spec.md

Only do this step if this project includes any changes, additions, or modifications to any routes, controllers or API endpoints. If not, then skip this step.

Inside of this project folder and inside the `specs/` folder, create the file `api-spec.md`.

At the top of this file, include 1-sentence paragraph that says:

"This is the API specs for the project detailed in @.agent_os/projects/YYYY-MM-DD-project-name/project.md" (replace the project folder name with the actual project folder name you created for this project).

The api-specs.md file may include any of the following (whichever items are applicatable):

- New routes and controller endpoints
- Purpose of each endpoint relative to project goals

**Example API Endpoints:**

```ruby
# routes.rb
post '/password_resets', to: 'password_resets#create'
get '/password_resets/:token/edit', to: 'password_resets#edit'
patch '/password_resets/:token', to: 'password_resets#update'
```

**Example Controller Endpoints:**

- **POST /password_resets** - Creates reset token and sends email
- **GET /password_resets/:token/edit** - Shows password reset form
- **PATCH /password_resets/:token** - Updates password and invalidates token

**Example Purpose Documentation:**

- **create:** Initiates password reset flow by generating secure token and sending email
- **edit:** Validates token and presents password reset form to user
- **update:** Processes new password, updates user record, and marks token as used

### Step 9: Create specs/tests.md

Inside of this project folder and inside the `specs/` folder, create the file `tests.md`.

At the top of this file, include 1-sentence paragraph that says:

"This is the tests coverage details for the project detailed in @.agent_os/projects/YYYY-MM-DD-project-name/project.md" (replace the project folder name with the actual project folder name you created for this project).

The tests.md file may include any of the following (whichever items are applicatable):

- List all tests to be written for the project
- Ensure that all new functionality we're adding in this project has tests coverage.
- If any tests will require 3rd party API integrations, specify that we will need to create mock API responses for those so that our tests don't hit actual 3rd party APIs.

**Example Test Coverage:**

```ruby
# Model Tests (PasswordReset)
- validates presence of user_id, token, expires_at
- validates uniqueness of token
- scope for expired tokens
- scope for unused tokens
- method to mark as used

# Controller Tests (PasswordResetsController)
- POST create: generates token, sends email, redirects with success message
- POST create: handles invalid email gracefully
- GET edit: shows form for valid token
- GET edit: redirects for expired/invalid token
- PATCH update: updates password and marks token used
- PATCH update: handles validation errors
- PATCH update: redirects for expired/invalid token

# Integration Tests
- Complete password reset flow from email to login
- Token expiration handling
- Multiple reset attempts for same user
- Email delivery confirmation

# Mailer Tests
- PasswordResetMailer#reset_email
- Email content validation
- Token inclusion in email
```

**Example Mock Requirements:**

- **Email Service:** Mock ActionMailer delivery to prevent actual emails during testing
- **Background Jobs:** Mock Sidekiq job enqueuing to test job creation without execution
- **Time-based Tests:** Use travel_to helper for testing token expiration scenarios

### Step 10: User Review

AGENT requests user review of PRD and all specs.

Wait for USER approval before proceeding.

### Step 11: Create tasks.md

Inside of this project folder, create the file `tasks.md`.

At the top of this file, include 1-sentence paragraph that says:

"These are the tasks to be completed for the project detailed in @.agent_os/projects/YYYY-MM-DD-project-name/project.md" (replace the project folder name with the actual project folder name you created for this project).

**Structure:**

- 1-5 major project pieces (numbered checklist items)
- Up to 8 sub-tasks per major piece (point-numbered: 3.1, 3.2, etc.)
- Logical ordering considering technical dependencies
- First sub-task typically: write tests (TDD approach)
- Last sub-task typically: complete and verify all tests pass

### Step 12: Documentation Cross-References

Update project.md to include references to:

- tasks.md
- Each file files in specs/ folder
- Ensure easy navigation for future reference

These references should be formatted as follows, with @ preceding the path to each file and the project folder name matching the folder name you created for this project.

@.agent_os/projects/YYYY-MM-DD-project-name/tasks.md
@.agent_os/projects/YYYY-MM-DD-project-name/specs/technical-spec.md
@.agent_os/projects/YYYY-MM-DD-project-name/specs/api-spec.md
@.agent_os/projects/YYYY-MM-DD-project-name/specs/database-schema.md
@.agent_os/projects/YYYY-MM-DD-project-name/specs/tests.md

### Step 13: Decision Documentation

**Review for strategic decisions:**

1. **Analysis:** Read PRD, specs, and tasks against mission.md and decisions.md.
2. **Decide:** Decide whether anything we're building in this project could reasonably be considered a decision to change or adjust our product's mission or roadmap. If yes, then proceed with proposing updates to our decisions.md file. If no, then simply state "This project is inline with the current mission and roadmap, so no need to post anything to our decisions log at this time."

If you decided that proposing decisions documentations is warranted, then:

1. **Identify:** Strategic, technical, or roadmap decisions that impact product mission and/or roadmap.
2. **Document:** List up to 3 key decisions in numbered format
3. **Confirm:** Ask user if decisions should be added to decisions.md
4. **Update:** If approved, add as newest entries in decisions.md

## Execution Standards

- Follow all existing code-style.md and dev-best-practices.md guidelines
- Ensure technical alignment with established tech stack
- Maintain consistency with overall product mission
- Create comprehensive documentation for future reference
