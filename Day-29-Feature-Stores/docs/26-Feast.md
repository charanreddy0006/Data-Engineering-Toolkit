# 26. Feast Concepts

## What Is Feast?

Feast is an open-source feature store framework designed to help define, manage and serve ML features.

## Core Concepts

### Entity
Defines the entity key used to identify feature records.

### Feature View
Groups feature definitions associated with data sources.

### Data Source
Describes where feature data comes from.

### Feature Service
Defines a set of features used by a model or application.

### Offline Store
Used for historical feature retrieval.

### Online Store
Used for low-latency serving.

## Conceptual Flow

```text
Source
  ↓
Feature View
  ↓
Feature Registry
  ├── Historical retrieval
  └── Materialization
          ↓
      Online Store
```

## Example Workflow

1. Define entities.
2. Define feature views.
3. Register definitions.
4. Retrieve historical training data.
5. Materialize online values.
6. Retrieve online features.

## Important

Exact commands and supported backends depend on the Feast version and deployment architecture. Always verify current behavior against the official documentation.
