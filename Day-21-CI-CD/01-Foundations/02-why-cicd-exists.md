# Why CI/CD Exists

A manual deployment might require an engineer to:

1. pull code,
2. install dependencies,
3. run tests,
4. build an image,
5. upload it,
6. change configuration,
7. deploy,
8. verify.

Every manual step can introduce variation.

## Automated model

```text
Commit
 ↓
CI validation
 ↓
Artifact
 ↓
Registry
 ↓
Staging
 ↓
Production
```

## Problems solved

### Feedback
Failures are detected sooner.

### Repeatability
The same commands run in a controlled environment.

### Traceability
A release can connect:

```text
commit → artifact → deployment
```

### Rollback
A previous immutable artifact can be redeployed.

## Limitation

A green pipeline is only as good as its tests. CI/CD does not prove that an application is correct.
