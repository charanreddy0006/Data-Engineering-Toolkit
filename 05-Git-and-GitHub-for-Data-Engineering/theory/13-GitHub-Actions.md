# GitHub Actions

## 1. Introduction

GitHub Actions is a workflow automation platform integrated into GitHub.

It can automatically execute tasks when events occur in a repository.

Common tasks include:

- Running tests
- Checking code quality
- Building applications
- Validating SQL
- Building Docker images
- Deploying pipelines

## 2. Basic Workflow

```text
Developer
    |
    v
git push
    |
    v
GitHub
    |
    v
GitHub Actions
    |
    +--> Test
    +--> Lint
    +--> Build
    |
    v
Result
```

## 3. Workflow Files

Workflows are usually stored in:

```text
.github/
└── workflows/
    └── tests.yml
```

Example structure:

```text
repository/
├── src/
├── tests/
├── .github/
│   └── workflows/
│       └── tests.yml
└── README.md
```

## 4. Basic Workflow

```yaml
name: Python Tests

on:
  push:
  pull_request:

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install dependencies
        run: pip install -r requirements.txt

      - name: Run tests
        run: pytest
```

## 5. Events

Actions can run when:

```yaml
on:
  push:
  pull_request:
```

Other events include:

- Issues
- Releases
- Scheduled workflows
- Manual workflow dispatch

## 6. Jobs

A workflow contains one or more jobs.

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
```

A job can contain multiple steps.

## 7. Steps

Example:

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v4

  - name: Run tests
    run: pytest
```

A step can execute a command or use an existing GitHub Action.

## 8. Scheduled Workflows

GitHub Actions can run workflows using cron syntax:

```yaml
on:
  schedule:
    - cron: "0 2 * * *"
```

This can be useful for scheduled checks and lightweight automation.

## 9. Data Engineering Example

A repository containing dbt models could run:

```text
Pull Request
     |
     v
GitHub Actions
     |
     +--> Install dbt
     |
     +--> Run SQL tests
     |
     +--> Run dbt tests
     |
     +--> Validate models
     |
     v
PR Status
```

## 10. Secrets

Sensitive values should not be written directly into workflow files.

GitHub provides repository secrets that workflows can access securely.

Example:

```yaml
env:
  DATABASE_PASSWORD: ${{ secrets.DATABASE_PASSWORD }}
```

Never write:

```yaml
DATABASE_PASSWORD: "my-password"
```

## 11. Data Pipeline CI

A Python pipeline may automatically run:

```text
Push
 |
 v
Install Dependencies
 |
 v
Unit Tests
 |
 v
Data Validation
 |
 v
Build
```

## 12. Advantages

- Automated testing
- GitHub integration
- Reproducible workflows
- Easy collaboration
- Deployment automation
- Scheduled tasks

## 13. Limitations

GitHub Actions is not a replacement for every Data Engineering orchestration platform.

Complex data workflows may require:

- Airflow
- Dagster
- Prefect
- Cloud orchestration
- Kubernetes

## 14. Best Practices

- Keep workflows small.
- Pin important action versions.
- Store secrets securely.
- Run tests on Pull Requests.
- Avoid unnecessary workflow executions.
- Separate testing and deployment workflows.

## Interview Questions

1. What is GitHub Actions?
2. What is a workflow?
3. What is a job?
4. What is a step?
5. How can GitHub Actions support Data Engineering?
6. How should secrets be handled?
7. GitHub Actions vs Airflow?

## Summary

GitHub Actions provides automated CI/CD capabilities directly within GitHub repositories and can help Data Engineers automate testing and deployment workflows.