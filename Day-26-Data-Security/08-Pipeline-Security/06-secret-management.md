# Secrets Management

## Purpose
Secrets include passwords, API keys, tokens, certificates, and private keys.

## Lifecycle

Create → Secure store → Runtime injection → Rotate → Revoke.

## Never

Do not commit secrets to Git, bake them into images, print them in logs, or place them in notebooks.
