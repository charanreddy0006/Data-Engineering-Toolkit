# Git Workflows

## 1. Introduction

A Git workflow defines how developers use branches, commits, reviews, and merges to manage a project.

Different teams use different workflows depending on project size and deployment requirements.

## 2. Simple Workflow

For a small project:

```text
main
 |
 +-- edit
 |
 +-- commit
 |
 +-- push
```

This works well for individual learning repositories.

## 3. Feature Branch Workflow

Developers create separate branches:

```text
main
 |
 +-- feature/ingestion
 |
 +-- feature/transformation
 |
 +-- feature/testing
```

After review, branches are merged into main.

## 4. Typical Workflow

```bash
git switch main
git pull

git switch -c feature/vehicle-ingestion

# Develop

git add .
git commit -m "Add vehicle ingestion"

git push -u origin feature/vehicle-ingestion
```

Then create a Pull Request.

## 5. GitHub Flow

GitHub Flow is a simple workflow:

```text
main
  |
  v
Create Branch
  |
  v
Develop
  |
  v
Commit
  |
  v
Push
  |
  v
Pull Request
  |
  v
Review
  |
  v
Merge
```

It works well for many modern development teams.

## 6. Git Flow

Git Flow uses multiple long-lived branches.

Common branches include:

```text
main
develop
feature/*
release/*
hotfix/*
```

Example:

```text
feature
   |
   v
develop
   |
   v
release
   |
   v
main
```

This can be useful for projects with formal release cycles, although many modern teams prefer simpler workflows.

## 7. Trunk-Based Development

Trunk-based development keeps development close to the main branch.

```text
main
 |
 +-- short-lived change
 |
 +-- short-lived change
 |
 +-- short-lived change
 |
 +-- main
```

Branches are kept very short-lived.

## 8. Data Engineering Workflow

A Data Engineering team may use:

```text
main
 |
 +-- feature/etl
 +-- feature/dbt-model
 +-- feature/airflow-dag
 +-- feature/data-quality
```

Each change can be tested independently.

## 9. Pull Request Workflow

```text
Developer
   |
   v
Feature Branch
   |
   v
Commit
   |
   v
Push
   |
   v
Pull Request
   |
   v
Automated Tests
   |
   v
Code Review
   |
   v
Merge
   |
   v
main
```

## 10. CI/CD Integration

A repository can automatically test pipeline code:

```text
Git Push
   |
   v
CI
   |
   +-- Unit Tests
   +-- SQL Tests
   +-- Linting
   +-- Build
   |
   v
Deploy
```

## 11. Choosing a Workflow

| Workflow | Best For |
|---|---|
| Simple | Individual projects |
| Feature Branch | Collaborative projects |
| GitHub Flow | Continuous development |
| Git Flow | Formal release cycles |
| Trunk-Based | Fast-moving teams |

## 12. Automobile Example

A vehicle analytics platform may have:

```text
main
 |
 +-- feature/vehicle-sales
 +-- feature/fleet-telemetry
 +-- feature/ev-charging
 +-- feature/predictive-maintenance
```

Each feature can move through:

```text
Development
    ↓
Testing
    ↓
Review
    ↓
Production
```

## 13. Best Practices

- Keep main stable.
- Use descriptive branch names.
- Keep changes small.
- Review code before merging.
- Automate tests.
- Delete completed branches.
- Use protected branches for production systems.

## Interview Questions

1. What is a Git workflow?
2. What is GitHub Flow?
3. What is Git Flow?
4. What is trunk-based development?
5. Which workflow is suitable for an individual project?
6. Why should production branches be protected?
7. How can Git workflows improve Data Engineering development?

## Summary

A well-defined Git workflow provides a consistent process for developing, reviewing, testing, and releasing Data Engineering code.