# Common Git Mistakes

## 1. Introduction

Git is powerful, but incorrect commands can cause lost work, broken branches, exposed credentials, or confusing project history.

Understanding common mistakes helps Data Engineers work safely.

## 2. Committing Secrets

Bad:

```bash
git add .env
git commit -m "Add configuration"
```

If `.env` contains credentials, the secret may become part of Git history.

Use:

```text
.env
```

inside `.gitignore`.

If a credential was exposed, rotate it immediately.

## 3. Committing Large Data

Avoid:

```text
vehicle_sensor_2026.csv
fleet_backup.sql
large_logs.zip
```

Large datasets should generally use:

- Object storage
- Data lakes
- Git LFS
- DVC
- Database systems

## 4. Using Vague Commit Messages

Bad:

```text
git commit -m "update"
```

Better:

```text
git commit -m "Add EV charging data validation"
```

## 5. Working Directly on Main

Avoid making large experimental changes directly on `main`.

Prefer:

```bash
git switch -c feature/new-pipeline
```

## 6. Forgetting to Pull

Before starting new work:

```bash
git switch main
git pull
```

Otherwise your branch may be based on outdated code.

## 7. Ignoring Git Status

Always check:

```bash
git status
```

before committing.

This helps identify:

- Untracked files
- Modified files
- Staged files
- Current branch

## 8. Using git add . Without Checking

This command:

```bash
git add .
```

can stage unintended files.

Review:

```bash
git status
```

and:

```bash
git diff --staged
```

before committing.

## 9. Force Pushing Carelessly

Avoid:

```bash
git push --force
```

on shared branches.

If rewriting history is necessary, prefer:

```bash
git push --force-with-lease
```

and follow team policy.

## 10. Ignoring Merge Conflicts

Never resolve conflicts by blindly accepting one side.

Understand both changes first.

For SQL or pipeline code, incorrect conflict resolution can produce incorrect data.

## 11. Deleting Work Accidentally

Commands such as:

```bash
git reset --hard
```

can discard local changes.

Use destructive commands only when you understand their effect.

## 12. Committing Generated Files

Avoid committing:

```text
__pycache__/
*.pyc
*.log
.venv/
build/
dist/
```

Use `.gitignore`.

## 13. Wrong Branch

Before making changes:

```bash
git branch --show-current
```

Make sure you are working on the intended branch.

## 14. Data Engineering Example

Imagine a developer accidentally commits:

```text
.env
production_credentials.json
raw_vehicle_data.csv
```

This creates:

```text
Security Risk
     +
Large Repository
     +
Possible Credential Exposure
```

A good repository prevents these problems using `.gitignore`, secret management, and repository policies.

## 15. Recovery

If a file is accidentally staged:

```bash
git restore --staged file
```

If a committed change needs to be safely undone:

```bash
git revert <commit>
```

If an uncommitted file was accidentally modified, recovery depends on the exact situation.

## 16. Best Practices

- Check your branch.
- Check `git status`.
- Review staged changes.
- Use `.gitignore`.
- Never commit secrets.
- Avoid unnecessary force pushes.
- Make focused commits.
- Test after resolving conflicts.

## Interview Questions

1. What happens if you commit a secret?
2. Why should large datasets not be stored in Git?
3. Why is `git reset --hard` dangerous?
4. Why should force push be avoided?
5. How can you prevent accidental commits?
6. How do you safely undo a committed change?

## Summary

Most Git problems can be prevented by checking the current branch, reviewing changes, protecting secrets, and using a disciplined workflow.
```

---

