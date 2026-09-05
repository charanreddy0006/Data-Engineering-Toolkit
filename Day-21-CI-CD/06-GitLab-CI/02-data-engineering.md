# GitLab CI for Data Engineering

Example:

```yaml
stages:
  - validate
  - test
  - build
  - deploy

validate:
  stage: validate
  script:
    - python scripts/validate_schema.py

test:
  stage: test
  script:
    - pytest

build:
  stage: build
  script:
    - docker build -t company/etl:$CI_COMMIT_SHA .

deploy:
  stage: deploy
  script:
    - echo "Deploy approved artifact"
```

Use secure CI variables/identity for real registries and deployment systems.

Promote the exact artifact represented by the commit SHA.
