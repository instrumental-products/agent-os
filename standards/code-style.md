# Code Style

Default instructions for code style and formatting.

## HTML Markup Formatting

### Indentation

- Use 2 spaces for indentation
- Nested elements should be indented one level deeper
- Content between the opening and closing tags should be on its own line and nested one level deeper.
- HTML attributes should all be on their own line, and aligned vertically.
- The closing > character should not be on its own line.

**Example HTML formatting:**

<div class="container">
  <header class="flex flex-col space-y-2
                 md:flex-row md:space-y-0 md:space-x-4">
    <h1 class="text-primary dark:text-primary-300">
      Page Title
    </h1>
    <nav class="flex flex-col space-y-2
                md:flex-row md:space-y-0 md:space-x-4">
      <a href="/"
         class="btn-ghost">
        Home
      </a>
      <a href="/about"
         class="btn-ghost">
        About
      </a>
    </nav>
  </header>
</div>

## Code Style

- Use 2 spaces for indentation
- Use snake_case for methods and variables
- Use CamelCase for classes and modules
- Prefer single quotes for strings unless interpolation is needed

## Code Commenting Standards

- Always include a brief code comment above business logic that isn't immediately obvious what it does.
- Do not remove any existing comments in the codebase unless you are removing the associated code.
- If changes to code result in the existing comments becoming inaccurate, fix the inaccuracies so that code comments are up to date with the current business logic.
