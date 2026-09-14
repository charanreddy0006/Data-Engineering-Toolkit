# Retention and Deletion

## Purpose
Connect governance policy to technical deletion.

## Design

A deletion requirement is incomplete until the organization can answer:

- Which copies exist?
- Which derived tables exist?
- Which backups/archives are covered?
- Who executes deletion?
- How is completion verified?
- What exceptions apply?

## Lineage Connection

Lineage helps locate downstream copies. Governance metadata can attach retention
rules to the relevant assets.
