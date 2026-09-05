# Testing Pyramid

```text
        E2E
       /    Integration
     /           Unit tests
```

## Unit

Fast and isolated.

## Integration

Verifies real component interactions such as Python + PostgreSQL.

## E2E

Tests a complete business flow and is usually slower.

## Data engineering

Test:

- Python,
- SQL,
- schemas,
- contracts,
- transformations,
- orchestration,
- quality rules.

A green unit test suite does not prove that a production data pipeline is correct.
