# GitHub Actions Basics

Workflows normally live in:

```text
.github/workflows/
```

Example:

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:

permissions:
  contents: read

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
      - run: pip install -r requirements.txt
      - run: pytest
```

## Core concepts

```text
event → workflow → job → steps
```

Review third-party actions before use and keep permissions minimal.
