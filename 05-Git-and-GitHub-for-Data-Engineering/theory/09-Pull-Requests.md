# Pull Requests

## 1. Introduction

A Pull Request, commonly called a PR, is a proposal to merge changes from one branch into another.

Pull Requests are an important part of collaborative software and Data Engineering development.

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
Code Review
      |
      v
CI Tests
      |
      v
Merge
```

## 2. Why Pull Requests?

Pull Requests provide:

- Code review
- Discussion
- Automated testing
- Change tracking
- Quality control

## 3. Creating a Feature Branch

```bash
git switch -c feature/vehicle-validation
```

Make changes:

```text
validate.py
tests/
README.md
```

Stage:

```bash
git add .
```

Commit:

```bash
git commit -m "Add vehicle data validation"
```

## 4. Push the Branch

```bash
git push -u origin feature/vehicle-validation
```

GitHub can then create a Pull Request from the branch.

## 5. Pull Request Structure

A good PR should include:

```text
Title
Description
Changes
Testing
Screenshots if relevant
Related Issue
```

Example:

```text
Title:
Add vehicle sensor validation

Changes:
- Validate required columns
- Detect null vehicle IDs
- Detect invalid temperatures

Testing:
- Added unit tests
- Tested with sample vehicle data
```

## 6. Code Review

Reviewers examine:

- Correctness
- Readability
- Security
- Performance
- Testing
- Documentation

For Data Engineering, reviewers may also check:

- SQL correctness
- Schema changes
- Pipeline dependencies
- Data quality
- Resource usage

## 7. Automated Checks

A PR can trigger:

```text
Pull Request
     |
     v
GitHub Actions
     |
     +-- Python Tests
     +-- SQL Checks
     +-- Linting
     +-- Build
     |
     v
Pass / Fail
```

## 8. Review Comments

Reviewers can comment on individual lines.

Example:

```text
Please add validation for missing vehicle IDs.
```

The developer can update the branch and push another commit.

The PR automatically updates.

## 9. Merge

Once the PR is approved:

```text
feature/vehicle-validation
          |
          v
       Approved
          |
          v
        Merge
          |
          v
         main
```

## 10. Merge Strategies

GitHub commonly provides:

- Merge commit
- Squash and merge
- Rebase and merge

### Merge Commit

Preserves the branch structure.

### Squash and Merge

Combines feature commits into one commit.

### Rebase and Merge

Places commits on top of the target branch.

The team should follow a consistent strategy.

## 11. Data Engineering Example

A developer creates:

```text
feature/fleet-data-quality
```

Changes:

```text
validate_schema.py
validate_records.py
tests/
```

PR:

```text
Feature Branch
      |
      v
GitHub PR
      |
      v
Review
      |
      v
Tests
      |
      v
main
```

## 12. Draft Pull Requests

A Draft PR can be used when work is not ready for final review.

It allows the team to see progress without treating the change as production-ready.

## 13. Best Practices

- Keep PRs focused.
- Write clear descriptions.
- Link related issues.
- Add tests.
- Keep changes reviewable.
- Respond to review comments.
- Avoid mixing unrelated changes.
- Make sure CI checks pass.

## Interview Questions

1. What is a Pull Request?
2. Why are Pull Requests useful?
3. What happens during code review?
4. What is a Draft PR?
5. What are common PR merge strategies?
6. Why should PRs remain focused?
7. How can Pull Requests improve Data Engineering pipelines?

## Summary

Pull Requests create a controlled process for reviewing, testing, and integrating changes into shared repositories.