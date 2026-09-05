# GitHub Actions Cheat Sheet

Common concepts:

```text
on
jobs
steps
runs-on
uses
run
with
env
permissions
needs
strategy.matrix
artifacts
environments
```

Minimal:

```yaml
name: CI

on:
  pull_request:

permissions:
  contents: read

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: pytest
```

Keep permissions minimal and review third-party actions.
