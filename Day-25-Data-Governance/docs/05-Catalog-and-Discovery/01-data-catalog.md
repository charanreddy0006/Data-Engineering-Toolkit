# Data Catalog

## Purpose
Understand how a catalog supports discovery and governance.

## What a Catalog Provides

A catalog can connect:
- datasets
- owners
- definitions
- schemas
- lineage
- quality signals
- classification
- policies
- usage information

## Catalog Workflow

```text
Source Systems -> Metadata Harvesting -> Catalog
                                      |
                     +----------------+----------------+
                     |                |                |
                 Search           Lineage          Quality
                     |                |                |
                     +----------------+----------------+
                                      |
                                Data Consumer
```

## Catalog Anti-Pattern

A catalog with thousands of stale assets and no ownership is not effective governance.
