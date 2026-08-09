# GitHub

## 1. Introduction

GitHub is a cloud-based development and collaboration platform built around Git repositories.

It allows teams to store source code, review changes, manage issues, automate workflows, and document projects.

For Data Engineers, GitHub can contain:

```text
Data Engineering Repository
│
├── Python
├── SQL
├── Bash
├── Airflow
├── dbt
├── Docker
├── Infrastructure
└── Documentation
```

## 2. GitHub Repository

A GitHub repository is a hosted Git repository.

A typical repository contains:

```text
repository/
├── README.md
├── .gitignore
├── LICENSE
├── src/
├── tests/
├── docs/
└── workflows/
```

## 3. Creating a Repository

A repository can be created from the GitHub interface.

Typical configuration includes:

- Repository name
- Description
- Visibility
- README
- `.gitignore`
- License

## 4. Connecting Local Repository

If a local project already exists:

```bash
git remote add origin <repository-url>
```

Set the main branch:

```bash
git branch -M main
```

Push:

```bash
git push -u origin main
```

## 5. Public vs Private

Public repositories can be viewed by anyone.

Private repositories restrict access to authorized users.

For a portfolio project, a public repository can demonstrate:

- Technical skills
- Projects
- Documentation
- Git practices
- Problem-solving ability

## 6. README

A professional README should explain:

- Project purpose
- Features
- Architecture
- Setup
- Usage
- Technologies
- Project structure
- Examples
- Contribution process

## 7. Issues

GitHub Issues are used to track tasks and problems.

Example:

```text
Issue #12
Add vehicle data validation
```

Possible labels:

```text
feature
bug
documentation
enhancement
good-first-issue
```

## 8. Pull Requests

Pull Requests allow developers to propose changes before merging them.

```text
Feature Branch
      |
      v
Push to GitHub
      |
      v
Pull Request
      |
      v
Review
      |
      v
Testing
      |
      v
Merge
```

## 9. Releases

GitHub releases can represent stable versions.

Example:

```text
v1.0.0
v1.1.0
v2.0.0
```

A Data Engineering project could release:

```text
v1.0.0 - Initial Pipeline
v1.1.0 - Added Data Quality
v2.0.0 - Added Streaming
```

## 10. GitHub Actions

GitHub Actions can automate tasks such as:

- Testing
- Linting
- Building
- Documentation checks
- Deployment

Example:

```text
Push Code
    |
    v
GitHub Actions
    |
    +-- Test
    +-- Lint
    +-- Build
    |
    v
Result
```

## 11. Data Engineering Example

A professional vehicle analytics repository could contain:

```text
vehicle-data-platform/
├── ingestion/
├── transformation/
├── airflow/
├── dbt/
├── sql/
├── tests/
├── docker/
├── docs/
├── datasets/
└── README.md
```

GitHub becomes the central collaboration platform.

## 12. GitHub Profile

A strong GitHub profile can demonstrate:

- Consistent learning
- Real projects
- Documentation quality
- Contributions
- Technical breadth

Your Data Engineering Toolkit can act as a long-term knowledge repository and portfolio project.

## 13. Security

Never commit:

```text
.env
API keys
passwords
private keys
database credentials
cloud credentials
```

Use:

- `.gitignore`
- Environment variables
- GitHub Secrets
- Cloud secret managers

## 14. Best Practices

- Keep repositories organized.
- Write professional READMEs.
- Use meaningful commit messages.
- Use issues for tasks.
- Use pull requests for collaborative changes.
- Protect production branches.
- Never expose credentials.

## Interview Questions

1. What is GitHub?
2. Difference between Git and GitHub?
3. What is a GitHub repository?
4. What are GitHub Issues?
5. What is a Pull Request?
6. What are GitHub Actions?
7. Why are GitHub Secrets useful?
8. How can GitHub help a Data Engineer?

## Summary

GitHub extends Git with collaboration, project management, automation, code review, and repository hosting capabilities.