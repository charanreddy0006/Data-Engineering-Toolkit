# Git Branches

## 1. Introduction

A Git branch is an independent line of development.

Branches allow developers to work on new features or fixes without directly changing the main production code.

```text
main
 |
 A
 |
 B
 |
 C
```

A feature can branch from the main line:

```text
main
 |
 A
 |
 B
 |\
 | \
 |  feature
 |    |
 |    C
 |    |
 |    D
 |
 E
```

---

## 2. Why Branches Matter

Branches are useful for:

- New features
- Bug fixes
- Experiments
- Data pipeline changes
- Code reviews
- Release preparation

---

## 3. View Branches

```bash
git branch
```

Show remote branches:

```bash
git branch -a
```

The current branch is usually marked with `*`.

---

## 4. Create a Branch

```bash
git branch feature/vehicle-validation
```

Switch to it:

```bash
git switch feature/vehicle-validation
```

---

## 5. Create and Switch

The shorter approach is:

```bash
git switch -c feature/vehicle-validation
```

This creates and switches to the new branch.

---

## 6. Older Command

You may also see:

```bash
git checkout -b feature/vehicle-validation
```

`git switch` is designed specifically for branch switching and is easier to understand for beginners.

---

## 7. Feature Branch

A Data Engineering project might use:

```text
main
 |
 +-- feature/vehicle-ingestion
 |
 +-- feature/data-quality
 |
 +-- feature/postgres-loader
```

Each feature can be developed separately.

---

## 8. Branch Naming

Good:

```text
feature/vehicle-ingestion
feature/data-validation
fix/duplicate-records
docs/update-readme
```

Avoid unclear names:

```text
test
new
branch1
mybranch
```

---

## 9. Working on a Feature

Create:

```bash
git switch -c feature/vehicle-validation
```

Modify files.

Check:

```bash
git status
```

Stage:

```bash
git add .
```

Commit:

```bash
git commit -m "Add vehicle data validation"
```

---

## 10. Switching Branches

Return to main:

```bash
git switch main
```

Return to feature:

```bash
git switch feature/vehicle-validation
```

---

## 11. Branch Isolation

Suppose `main` contains:

```text
extract.py
transform.py
load.py
```

A feature branch can add:

```text
validate.py
```

The main branch remains unchanged until the feature is merged.

---

## 12. Delete a Branch

After a feature has been merged:

```bash
git branch -d feature/vehicle-validation
```

Force deletion:

```bash
git branch -D feature/vehicle-validation
```

Use `-D` carefully because it can delete unmerged work.

---

## 13. Data Engineering Example

Imagine a production pipeline:

```text
main
 |
 +-- Extraction
 +-- Transformation
 +-- Loading
```

You want to add data quality checks.

Create:

```bash
git switch -c feature/data-quality
```

Implement:

```text
validate_schema()
validate_nulls()
validate_duplicates()
```

Commit:

```bash
git commit -m "Add vehicle data quality checks"
```

Then the feature can be reviewed before merging.

---

## 14. Branch Workflow

```text
main
  |
  +---- feature/data-quality
  |             |
  |             v
  |        Development
  |             |
  |             v
  |          Testing
  |             |
  |             v
  +-------- Pull Request
                |
                v
              Merge
```

---

## 15. Main Branch

The `main` branch generally represents stable code.

Production deployments should normally come from reviewed and tested code rather than unfinished feature branches.

---

## 16. Best Practices

- Keep branches focused.
- Use descriptive names.
- Keep feature branches reasonably short-lived.
- Pull the latest main changes regularly.
- Test before merging.
- Delete obsolete branches.
- Protect the main branch in collaborative repositories.

---

## Interview Questions

1. What is a Git branch?
2. Why are branches used?
3. How do you create a branch?
4. Difference between `git branch` and `git switch`?
5. How do you delete a branch?
6. What is a feature branch?
7. Why should main contain stable code?
8. How are branches useful in Data Engineering?

## Summary

Branches provide isolated development environments and allow Data Engineers to safely develop pipeline changes before merging them into stable code.