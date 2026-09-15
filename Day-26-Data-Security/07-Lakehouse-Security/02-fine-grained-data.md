# Lakehouse Fine-Grained Security

## Purpose
Combine catalog metadata and platform permissions to restrict tables, rows, or columns.

## Pattern

```text
Catalog/Policy → Resource Permission → Row/Column Control → Query
```

## Goal

Make sensitive data usable for approved purposes without broad raw access.
