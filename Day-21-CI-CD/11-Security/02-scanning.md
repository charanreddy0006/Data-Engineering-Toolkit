# Dependency and Image Scanning

## Dependency scanning

Find known vulnerabilities in:

- Python packages,
- Node packages,
- OS packages.

## Image scanning

An image can contain vulnerable:

- base OS packages,
- language dependencies,
- application libraries.

## Pipeline

```text
build
 ↓
scan
 ↓
policy
 ↓
publish
```

A policy can block releases for serious unresolved vulnerabilities.

Scanning is one control, not a guarantee of security.
