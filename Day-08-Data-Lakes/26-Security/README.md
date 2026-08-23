# 26 — Data Lake Security

## Authentication

Verify who is accessing the platform.

## Authorization

Determine what that identity is allowed to access.

## Least Privilege

Give users and services only the permissions they require.

## Encryption

Use encryption:

```text
At Rest
In Transit
```

## Secrets

Never commit credentials to Git.

Use environment variables, secret managers, or platform-managed identities.

## Auditing

Record important access and administrative actions.

## Network Security

Production storage should not be unnecessarily exposed to the public internet.

## Automobile Example

Sensitive vehicle and customer datasets can be separated by permissions so that
analytics users cannot automatically access raw personally identifiable data.
