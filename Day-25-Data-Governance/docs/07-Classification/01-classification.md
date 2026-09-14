# Data Classification

## Purpose
Learn how organizations categorize data according to risk.

## Example Classification

One possible four-level model:

| Class | Meaning | Typical Control |
|---|---|---|
| PUBLIC | Approved for public release | basic integrity |
| INTERNAL | Organization use | authenticated access |
| CONFIDENTIAL | Business-sensitive | restricted groups + monitoring |
| RESTRICTED | High-risk/sensitive | strong access, encryption, audit, limited sharing |

These labels are examples; an organization's official classification scheme must be
defined by its own policy.

## Classification Workflow

```text
Discover -> Classify -> Owner Approval -> Control -> Monitor -> Review
```
