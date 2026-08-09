# Git Best Practices

## 1. Introduction

Professional Git usage is more than knowing commands.

A good Git workflow should make projects:

- Maintainable
- Secure
- Reproducible
- Reviewable
- Collaborative

## 2. Use Meaningful Commit Messages

Good:

```text
Add vehicle sensor ingestion
Fix duplicate vehicle records
Add PostgreSQL loading stage
Add EV battery validation
```

Avoid:

```text
update
final
changes
test
```

## 3. Make Small Commits

Prefer:

```text
Add ingestion
Add transformation
Add validation
```

instead of one enormous commit containing unrelated changes.

## 4. Use Branches

Create focused branches:

```bash
git switch -c feature/vehicle-ingestion
```

Examples:

```text
feature/vehicle-ingestion
feature/data-quality
feature/dbt-models
fix/schema-validation
docs/update-readme
```

## 5. Review Before Commit

Check:

```bash
git status
```

Then:

```bash
git diff
```

After staging:

```bash
git diff --staged
```

Only commit changes that belong to the intended task.

## 6. Protect Secrets

Never commit:

```text
.env
API keys
Passwords
Private keys
Cloud credentials
Database credentials
```

Use:

```text
.gitignore
Environment Variables
Secret Managers
GitHub Secrets
```

## 7. Avoid Large Files

Git repositories should not become storage systems for huge datasets.

Avoid committing:

```text
raw_sensor_data.csv
large_logs.zip
database_backup.sql
```

Use appropriate object storage or data versioning systems.

## 8. Keep Main Stable

The main branch should contain reviewed and tested code.

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
main
```

## 9. Use Pull Requests

Collaborative changes should normally go through Pull Requests.

This allows:

- Review
- Discussion
- Automated testing
- Documentation
- Audit history

## 10. Pull Before Starting Work

Before creating a new feature:

```bash
git switch main
git pull
```

Then:

```bash
git switch -c feature/new-feature
```

This reduces unnecessary conflicts.

## 11. Write Documentation

Important Data Engineering repositories should document:

- Architecture
- Setup
- Pipeline execution
- Configuration
- Data sources
- Dependencies
- Testing

## 12. Test Before Push

Before pushing:

```bash
pytest
```

or run appropriate pipeline checks.

For SQL:

```text
Syntax
Schema
Data Quality
```

For Airflow:

```text
DAG Import
Dependencies
Tests
```

## 13. Use .gitignore

Every project should have a suitable `.gitignore`.

Example:

```text
.env
__pycache__/
.venv/
*.log
data/raw/
```

## 14. Avoid Force Push

Avoid:

```bash
git push --force
```

especially on shared branches.

If force pushing is genuinely required, use the safer form when appropriate:

```bash
git push --force-with-lease
```

## 15. Use Tags for Releases

Important versions can be tagged:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## 16. Data Engineering Example

A professional workflow:

```text
Issue
  |
  v
Feature Branch
  |
  v
Code
  |
  v
Tests
  |
  v
Commit
  |
  v
Pull Request
  |
  v
CI
  |
  v
Review
  |
  v
Merge
  |
  v
Deploy
```

## 17. Repository Hygiene

Keep repositories organized.

```text
vehicle-pipeline/
├── src/
├── sql/
├── tests/
├── docs/
├── scripts/
├── .github/
├── .gitignore
├── README.md
└── LICENSE
```

Avoid unnecessary files at the repository root.

## 18. Best Practices Checklist

```text
[ ] Meaningful commits
[ ] Focused branches
[ ] .gitignore configured
[ ] No secrets
[ ] Tests passing
[ ] Documentation updated
[ ] PR reviewed
[ ] Main protected
[ ] Releases tagged
[ ] Large data stored appropriately
```

## Interview Questions

1. What are Git best practices?
2. Why should commits be small?
3. Why should secrets never be committed?
4. Why should main be protected?
5. Why should Pull Requests be used?
6. What is `--force-with-lease`?
7. Why should large datasets not normally be stored in Git?

## Summary

Good Git practices make Data Engineering repositories secure, collaborative, maintainable, and production-ready.
```