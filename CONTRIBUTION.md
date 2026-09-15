# Contribution Guidelines

Thank you for considering contributing to this project! Please follow these guidelines to help keep the project organized and maintainable.

## Commit Message Format

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools and libraries

### Examples

```
feat(auth): add user login functionality

fix(api): resolve user data fetching error

docs: update API documentation

refactor(frontend): simplify component structure
```

## Pull Request Guidelines

### PR Title Format

Use the same format as commit messages:

```
<type>[optional scope]: <description>
```

### PR Description Template

When creating a PR, please include:

```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update
- [ ] Refactor
- [ ] Other (please describe)

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] Any dependent changes have been merged and published
```

### Review Process

1. All PRs require at least one approval before merging
2. Ensure all CI checks pass
3. Address all review comments
4. Squash commits if requested by maintainers

## Branch Naming

Use descriptive branch names following this pattern:

```
<type>/<short-description>
```

Examples:
- `feat/user-authentication`
- `fix/api-timeout-error`
- `docs/update-readme`

## Code Style

- Follow the existing code style in each directory (frontend/backend)
- Run linters before committing
- Write meaningful variable and function names
- Keep functions small and focused

## Reporting Issues

When reporting issues, please include:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Environment details (OS, browser, version)
- Screenshots if applicable