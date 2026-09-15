# Authentication vs Authorization

## Purpose
Authentication verifies identity; authorization decides permitted actions.

## Flow

`Authenticate → Identify Principal → Evaluate Policy → Allow/Deny → Audit`

## Example

A user can successfully authenticate but still be denied access to restricted telemetry.
