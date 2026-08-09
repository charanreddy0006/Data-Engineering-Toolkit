## `19-Interview-Questions.md`

````markdown
# Git & GitHub Interview Questions

## Git Fundamentals

### 1. What is Git?

Git is a distributed version control system used to track changes and manage project history.

### 2. What is GitHub?

GitHub is a platform for hosting Git repositories and providing collaboration, code review, project management, and automation.

### 3. Git vs GitHub?

```text
Git     → Version control
GitHub  → Repository hosting + collaboration
```

### 4. What is a repository?

A repository contains project files and their Git history.

### 5. What is a commit?

A commit is a recorded snapshot of staged changes.

## Staging and Commits

### 6. What does git add do?

It moves selected changes into the staging area.

```bash
git add file.py
```

### 7. What does git commit do?

It records staged changes in Git history.

```bash
git commit -m "Add pipeline"
```

### 8. What does git status do?

It shows the current branch and working tree state.

### 9. What does git diff do?

It displays changes that have not been committed.

### 10. What is an atomic commit?

A commit containing one logical change.

## Branches

### 11. What is a branch?

A branch is an independent line of development.

### 12. How do you create a branch?

```bash
git switch -c feature/data-quality
```

### 13. Why are branches useful?

They allow developers to develop features independently without directly modifying stable code.

### 14. How do you delete a branch?

```bash
git branch -d feature/data-quality
```

## Remote Repositories

### 15. What is a remote?

A remote is a connection to another Git repository.

```bash
git remote -v
```

### 16. What is origin?

`origin` is the conventional name assigned to the primary remote repository.

### 17. Difference between fetch and pull?

```text
fetch → Download remote information
pull  → Fetch + integrate changes
```

### 18. What does push do?

Uploads local commits to a remote repository.

```bash
git push
```

## Pull Requests

### 19. What is a Pull Request?

A Pull Request proposes changes from one branch to another for review and integration.

### 20. Why are Pull Requests useful?

They provide:

- Code review
- Automated testing
- Discussion
- Change tracking
- Quality control

## Merge and Rebase

### 21. What is merge?

Merge combines changes from different branches.

### 22. What is rebase?

Rebase moves commits onto a new base and creates a linear history.

### 23. Merge vs rebase?

```text
Merge  → Preserves branch history
Rebase → Rewrites history for a linear structure
```

### 24. What is a merge conflict?

A conflict occurs when Git cannot automatically combine incompatible changes.

## .gitignore

### 25. What is .gitignore?

A file containing patterns for files Git should not track.

### 26. Why ignore .env?

It commonly contains credentials and sensitive configuration.

### 27. Does .gitignore remove already tracked files?

No.

Use:

```bash
git rm --cached file
```

## GitHub Actions

### 28. What is GitHub Actions?

A platform for automating development workflows.

### 29. How can it help Data Engineers?

It can automatically:

- Test Python
- Validate SQL
- Test Airflow DAGs
- Run dbt tests
- Build Docker images
- Deploy applications

## Data Engineering

### 30. Why is Git important for Data Engineers?

Data Engineers manage code such as:

```text
Python
SQL
Bash
Airflow DAGs
dbt models
Dockerfiles
Infrastructure
```

Git provides version control for these components.

### 31. Should raw datasets be stored in Git?

Generally, large raw datasets should use appropriate data storage or data versioning solutions.

### 32. How does Git improve reproducibility?

A pipeline can be associated with a specific commit or release.

```text
Production Run
      |
      v
Commit Hash
      |
      v
Pipeline Version
```

### 33. How would you manage a production pipeline change?

A typical process:

```text
Issue
 ↓
Feature Branch
 ↓
Development
 ↓
Testing
 ↓
Pull Request
 ↓
Review
 ↓
CI
 ↓
Merge
 ↓
Deploy
```

### 34. What should never be committed?

Examples:

```text
Passwords
API Keys
Private Keys
.env
Cloud Credentials
```

## Practical Questions

### 35. Create a repository

```bash
git init
```

### 36. Create a commit

```bash
git add .
git commit -m "Add pipeline"
```

### 37. Create a branch

```bash
git switch -c feature/pipeline
```

### 38. Push a branch

```bash
git push -u origin feature/pipeline
```

### 39. View history

```bash
git log --oneline
```

### 40. Undo a shared commit safely

```bash
git revert <commit>
```

## Summary

Git interviews often test both command knowledge and practical workflow understanding.

For Data Engineering roles, focus especially on:

```text
Git
Branches
Pull Requests
CI/CD
SQL Versioning
Pipeline Versioning
Data Quality
Secrets
Reproducibility
```