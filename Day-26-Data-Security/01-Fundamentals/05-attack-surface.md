# Attack Surface

## Purpose
The attack surface includes APIs, databases, storage, notebooks, CI/CD, containers, brokers, service accounts, admin interfaces, and secrets.

## Reduction

Remove unused services, close unnecessary network paths, minimize permissions, patch dependencies, rotate credentials, and disable unused identities.

## Data-engineering risk

A single over-privileged pipeline identity can expose many downstream datasets.
