# 13 — Docker Security

## Principle

Containers do not automatically make applications secure.

Security includes:

```text
Host
Runtime
Image
Application
Dependencies
Credentials
Network
Permissions
```

## Non-root

```dockerfile
RUN useradd --create-home appuser
USER appuser
```

## Minimal Images

Avoid unnecessary packages.

Benefits:

- smaller attack surface
- fewer components to patch
- faster downloads
- less storage

## Secrets

Never put production secrets in:

```text
Dockerfile
Git
README
Image
```

Bad:

```dockerfile
ENV API_KEY=real-secret
```

## Networking

Do not publish databases unless required.

## Least Privilege

Consider:

- non-root
- restricted capabilities
- restricted networks
- read-only filesystem where practical
- dedicated service accounts

## Supply Chain

Use:

- trusted base images
- dependency scanning
- image scanning
- controlled registries
- versioned artifacts
- provenance/signing where appropriate

## Automobile Security

Vehicle telemetry can be operationally sensitive.

Prefer:

```text
Internet
 ↓
Authenticated API
 ↓
Private network
 ↓
Database
```

instead of direct database exposure.

## Security Checklist

```text
[ ] No secrets in Git
[ ] No secrets in image
[ ] Non-root
[ ] Trusted base
[ ] Minimal dependencies
[ ] Image scanning
[ ] Required ports only
[ ] Least privilege
[ ] Updated dependencies
```
