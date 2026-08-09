# Git Repository and Commits

## 1. Git Repository

A Git repository is a project whose files and history are managed by Git.

Example:

```text
vehicle-pipeline/
├── .git/
├── src/
├── sql/
├── scripts/
├── tests/
└── README.md
```

The `.git` directory stores Git's internal information.

---

## 2. Creating a Repository

Create a project:

```bash
mkdir vehicle-pipeline
cd vehicle-pipeline
```

Initialize Git:

```bash
git init
```

Set the branch name:

```bash
git branch -M main
```

---

## 3. First Project Files

Create a README:

```bash
echo "# Vehicle Pipeline" > README.md
```

Check:

```bash
git status
```

The README will appear as an untracked file.

---

## 4. First Commit

Stage the file:

```bash
git add README.md
```

Create the commit:

```bash
git commit -m "Initial project setup"
```

Now the file is part of Git history.

---

## 5. What Is a Commit?

A commit is a recorded snapshot of changes.

For example:

```text
Commit A
Initial project
     ↓
Commit B
Add extraction
     ↓
Commit C
Add transformation
     ↓
Commit D
Add database loading
```

Each commit represents a specific point in project development.

---

## 6. Commit Hash

Every commit receives a unique identifier.

Example:

```text
a42c91f
```

The complete hash is longer, but Git often displays a shortened version.

View commits:

```bash
git log --oneline
```

---

## 7. Inspect a Commit

```bash
git show a42c91f
```

This displays the changes introduced by that commit.

---

## 8. Good Commit Messages

Good examples:

```text
Add vehicle ingestion pipeline
Add PostgreSQL loading stage
Fix duplicate vehicle records
Add vehicle data validation
Update pipeline documentation
```

Avoid vague messages:

```text
update
changes
final
new
test
```

A commit message should explain **what changed**.

---

## 9. Atomic Commits

An atomic commit contains one logical change.

Good:

```text
Add vehicle extraction stage
```

Then:

```text
Add vehicle transformation stage
```

Then:

```text
Add PostgreSQL loading stage
```

This makes history easier to understand.

---

## 10. View History

Full history:

```bash
git log
```

Compact history:

```bash
git log --oneline
```

Graph:

```bash
git log --oneline --graph --all
```

---

## 11. Revert a Commit

If a previous change needs to be undone:

```bash
git revert <commit-hash>
```

Example:

```bash
git revert a42c91f
```

Git creates a new commit that reverses the selected change.

This is generally safer for shared branches.

---

## 12. Reset

Git also provides:

```bash
git reset
```

Different reset modes affect the staging area and working directory differently.

Because reset can rewrite project history, it should be used carefully, especially on shared branches.

---

## 13. Tags

Tags can identify important versions.

```bash
git tag v1.0.0
```

List tags:

```bash
git tag
```

Tags are useful for releases such as:

```text
v1.0.0
v1.1.0
v2.0.0
```

---

## 14. Data Engineering Example

A pipeline repository might develop like this:

```text
Initial Repository
       ↓
Add CSV Extraction
       ↓
Add Data Cleaning
       ↓
Add SQL Transformations
       ↓
Add PostgreSQL Loading
       ↓
Add Data Quality Checks
```

Each stage can have its own commit.

---

## 15. Reproducibility

Git allows a Data Engineer to identify the exact version of pipeline code used at a particular point in time.

```text
Production Run
      ↓
Commit: a42c91f
      ↓
Pipeline Version
```

This is important when investigating production failures.

---

## 16. Commit History Example

```text
a42c91f Add data quality validation
81ab234 Add PostgreSQL loader
3bc881a Add transformation logic
91ad234 Add vehicle extraction
4bc991a Initial project
```

An engineer can understand the project's evolution from this history.

---

## 17. Best Practices

- Keep commits focused.
- Use descriptive messages.
- Review changes before committing.
- Avoid huge commits.
- Do not commit credentials.
- Use tags for important releases.
- Avoid rewriting shared history.

---

## Interview Questions

1. What is a Git repository?
2. What is a commit?
3. What is a commit hash?
4. What is an atomic commit?
5. How do you inspect a commit?
6. Difference between `git revert` and `git reset`?
7. What are Git tags?
8. Why is Git history important for Data Engineering?
9. How does Git support reproducibility?
10. What makes a good commit message?

## Summary

Repositories provide the project structure, while commits provide a reliable history of how the project changes over time.