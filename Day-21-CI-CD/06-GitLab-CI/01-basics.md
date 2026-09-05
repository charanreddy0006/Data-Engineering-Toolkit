# GitLab CI Basics

GitLab CI commonly uses:

```text
.gitlab-ci.yml
```

Example:

```yaml
stages:
  - test
  - build

test:
  stage: test
  image: python:3.12
  script:
    - pip install -r requirements.txt
    - pytest

build:
  stage: build
  script:
    - echo "Build artifact"
```

## Concepts

```text
stages → jobs → runner
```

Variables and artifacts can be configured through GitLab CI mechanisms.

The same fundamental CI/CD concepts transfer between GitHub Actions and GitLab CI.
