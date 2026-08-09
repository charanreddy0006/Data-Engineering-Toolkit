# Git & GitHub Cheat Sheet

## Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global --list
```

## Repository

```bash
git init
git status
git clone <url>
```

## Files

```bash
git add file.py
git add .
git rm file.py
git mv old.py new.py
```

## Commits

```bash
git commit -m "Add pipeline"
git log
git log --oneline
git show <commit>
```

## Changes

```bash
git diff
git diff --staged
git restore file.py
git restore --staged file.py
```

## Branches

```bash
git branch
git branch -a

git switch main
git switch -c feature/pipeline

git branch -d feature/pipeline
```

## Merge

```bash
git switch main
git merge feature/pipeline
```

Abort:

```bash
git merge --abort
```

## Rebase

```bash
git switch feature/pipeline
git rebase main
```

Abort:

```bash
git rebase --abort
```

Continue:

```bash
git rebase --continue
```

## Remote

```bash
git remote -v
git remote add origin <url>
git remote remove origin
```

## Push

```bash
git push
git push -u origin main
git push -u origin feature/pipeline
```

## Fetch / Pull

```bash
git fetch origin
git pull origin main
```

## Tags

```bash
git tag
git tag v1.0.0
git push origin v1.0.0
```

## Revert

```bash
git revert <commit>
```

## GitHub Workflow

```text
Issue
  ↓
Branch
  ↓
Code
  ↓
Test
  ↓
Commit
  ↓
Push
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

## .gitignore

Common entries:

```text
.env
.env.*
__pycache__/
*.pyc
.venv/
venv/
*.log
logs/
data/raw/
data/processed/
```

## Data Engineering Repository

```text
project/
├── src/
├── sql/
├── dags/
├── tests/
├── scripts/
├── docs/
├── .github/
├── .gitignore
├── README.md
└── LICENSE
```

## Common Commit Messages

```text
Add vehicle ingestion pipeline
Add data quality checks
Fix duplicate vehicle records
Update SQL transformation
Add Airflow DAG
Add dbt model
Update documentation
Fix pipeline configuration
```

## Important Safety Rules

```text
Never commit secrets
Never commit production credentials
Review git status
Review git diff
Keep main stable
Use Pull Requests
Test before merging
Avoid unnecessary force pushes
```

## Core Commands

```text
git init
git clone
git status
git add
git commit
git log
git diff
git branch
git switch
git merge
git rebase
git remote
git fetch
git pull
git push
git revert
git tag
```