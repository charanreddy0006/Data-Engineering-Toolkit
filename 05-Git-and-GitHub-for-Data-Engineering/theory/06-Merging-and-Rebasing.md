# Git Merging and Rebasing

## 1. Introduction

When multiple branches contain different changes, Git provides mechanisms to combine their histories.

The two important approaches are:

- Merge
- Rebase

Both can integrate changes, but they produce different commit histories.

---

## 2. Merge

Suppose:

```text
A---B---C  main
     \
      D---E  feature
```

After merging:

```text
A---B---C-------M  main
     \           /
      D---------E
```

The merge commit combines the two histories.

---

## 3. Basic Merge

Switch to main:

```bash
git switch main
```

Merge the feature:

```bash
git merge feature/vehicle-validation
```

If there are no conflicts, Git completes the merge.

---

## 4. Fast-Forward Merge

Sometimes main has not changed since the feature branch was created.

```text
A---B---C
         \
          D---E
```

Git can simply move the main branch pointer forward.

```text
A---B---C---D---E
```

This is called a fast-forward merge.

---

## 5. Three-Way Merge

If both branches have new commits:

```text
A---B---C---F  main
     \
      D---E    feature
```

Git may create:

```text
A---B---C---F---M
     \         /
      D---E---
```

`M` represents the merge commit.

---

## 6. Merge Conflicts

A conflict can occur when different branches modify the same part of a file.

Example:

```text
<<<<<<< HEAD
SELECT * FROM vehicles;
=======
SELECT * FROM electric_vehicles;
>>>>>>> feature/query
```

The developer must choose the correct content.

After resolving:

```bash
git add file.sql
```

Then:

```bash
git commit
```

---

## 7. Rebase

Rebase moves commits onto another base.

Original:

```text
A---B---C  main
     \
      D---E  feature
```

After:

```bash
git switch feature
git rebase main
```

The result becomes conceptually:

```text
A---B---C---D'---E'
```

The feature commits are replayed on top of the latest main.

---

## 8. Merge vs Rebase

| Merge | Rebase |
|---|---|
| Preserves branch history | Creates linear history |
| Can create merge commits | Usually avoids merge commits |
| Safer for shared history | Rewrites commit history |
| Easier for beginners | Requires more care |

---

## 9. Important Rule

Avoid rebasing commits that other developers are already using unless the team understands the consequences.

Rebase rewrites commit history.

---

## 10. Data Engineering Example

Suppose:

```text
main
 |
 +-- Production Pipeline
 |
feature/data-quality
 |
 +-- Null checks
 +-- Duplicate checks
```

If main receives important changes, the feature branch can be updated.

Using merge:

```bash
git switch feature/data-quality
git merge main
```

Or using rebase:

```bash
git switch feature/data-quality
git rebase main
```

---

## 11. Conflict Resolution Workflow

```text
Merge / Rebase
      |
      v
Conflict?
   /     \
 No       Yes
 |         |
Done    Inspect
           |
           v
      Resolve Files
           |
           v
       git add
           |
           v
     Continue/Commit
```

During a merge conflict:

```bash
git status
```

shows the affected files.

After resolving:

```bash
git add .
git commit
```

---

## 12. Abort Merge

If you want to cancel an unfinished merge:

```bash
git merge --abort
```

For a rebase:

```bash
git rebase --abort
```

---

## 13. Best Practices

- Keep branches focused.
- Pull or fetch latest changes regularly.
- Resolve conflicts carefully.
- Test after merging.
- Avoid rebasing shared public history.
- Use merge or rebase according to team conventions.

---

## 14. Data Pipeline Example

A team may have:

```text
main
  |
  +-- stable ETL
  |
  +-- feature/sensor-cleaning
  |
  +-- feature/database-loader
```

After development, features can be reviewed and merged into main.

```text
Feature
   |
   v
Testing
   |
   v
Review
   |
   v
Merge
   |
   v
main
```

---

## Interview Questions

1. What is Git merge?
2. What is Git rebase?
3. Difference between merge and rebase?
4. What is a fast-forward merge?
5. What causes merge conflicts?
6. How do you resolve a merge conflict?
7. How do you abort a merge?
8. Why can rebasing shared history be dangerous?

## Summary

Merge combines branch histories while rebase creates a rewritten linear history. Both are important for managing collaborative Data Engineering projects.