# Git Basics

## 1. Introduction

Git provides commands for tracking changes, creating commits, managing branches, and working with remote repositories.

A typical Git workflow is:

```text
Edit Files
    ↓
Check Changes
    ↓
Stage Changes
    ↓
Create Commit
    ↓
Push to Remote
```

---

## 2. Check Git Version

```bash
git --version
```

---

## 3. Initialize a Repository

Navigate to a project:

```bash
cd vehicle-pipeline
```

Initialize Git:

```bash
git init
```

Git creates a hidden `.git` directory:

```text
vehicle-pipeline/
├── .git/
├── src/
├── sql/
└── README.md
```

---

## 4. Check Repository Status

```bash
git status
```

This displays:

- Current branch
- Modified files
- Staged files
- Untracked files

---

## 5. Add Files

Add one file:

```bash
git add README.md
```

Add multiple files:

```bash
git add extract.py transform.py
```

Add all changes:

```bash
git add .
```

---

## 6. Create a Commit

```bash
git commit -m "Add vehicle extraction pipeline"
```

A commit stores a snapshot of the staged changes.

---

## 7. View Commit History

```bash
git log
```

Compact history:

```bash
git log --oneline
```

Example:

```text
a42c91f Add vehicle transformation
81ab234 Add ingestion pipeline
4bc991a Initial project
```

---

## 8. View Changes

Unstaged changes:

```bash
git diff
```

Staged changes:

```bash
git diff --staged
```

This should be checked before committing important changes.

---

## 9. Unstage Files

If a file was accidentally staged:

```bash
git restore --staged pipeline.py
```

The file remains modified but is removed from the staging area.

---

## 10. Restore Changes

To discard changes to a tracked file:

```bash
git restore pipeline.py
```

This should be used carefully because uncommitted changes can be lost.

---

## 11. Remove Files

```bash
git rm old_pipeline.py
```

Then commit:

```bash
git commit -m "Remove obsolete pipeline"
```

---

## 12. Rename Files

```bash
git mv old_pipeline.py vehicle_pipeline.py
```

Git tracks the rename as part of the change.

---

## 13. Git Status Workflow

```bash
git status

git add .

git status

git diff --staged

git commit -m "Update vehicle pipeline"
```

---

## 14. Data Engineering Example

Consider:

```text
vehicle-pipeline/
├── extract.py
├── transform.py
├── load.py
├── sql/
│   └── sales.sql
└── README.md
```

After modifying the pipeline:

```bash
git status
```

Stage the required files:

```bash
git add extract.py transform.py
```

Review:

```bash
git diff --staged
```

Commit:

```bash
git commit -m "Update vehicle ETL pipeline"
```

---

## 15. Git as a Safety Mechanism

Git allows developers to maintain a history of changes.

```text
Initial Pipeline
       ↓
Add Extraction
       ↓
Add Transformation
       ↓
Add Database Loading
       ↓
Add Data Quality
```

If a later change causes a problem, previous commits can be inspected.

---

## 16. Best Practices

- Check `git status` regularly.
- Review changes before committing.
- Make small logical commits.
- Write descriptive commit messages.
- Avoid committing secrets.
- Avoid committing unnecessary generated files.
- Keep unrelated changes in separate commits.

---

## Interview Questions

1. What does `git init` do?
2. What is the purpose of `git status`?
3. Difference between `git add` and `git commit`?
4. What does `git diff` show?
5. How do you unstage a file?
6. How do you rename a file using Git?
7. How do you view commit history?
8. Why should commits be logically separated?
9. What happens when `git restore` is used?
10. Why is `git status` important before committing?

## Summary

The fundamental Git workflow is:

```text
Working Directory
       ↓
git add
       ↓
Staging Area
       ↓
git commit
       ↓
Repository History
```

These commands form the foundation for professional Git workflows.