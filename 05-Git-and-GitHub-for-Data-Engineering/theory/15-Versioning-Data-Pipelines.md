# Versioning Data Pipelines

## 1. Introduction

Data pipelines change over time.

Source schemas change, business rules evolve, transformations are modified, and new data sources are added.

Version control allows Data Engineers to track these changes.

```text
Pipeline v1
    |
    v
Pipeline v2
    |
    v
Pipeline v3
```

## 2. What Should Be Versioned?

A Data Engineering repository can version:

- Python code
- SQL
- Bash scripts
- Airflow DAGs
- dbt models
- Dockerfiles
- Configuration templates
- Infrastructure code
- Documentation
- Tests

## 3. What Should Usually Not Be Versioned Directly?

Avoid committing:

- Production secrets
- Large raw datasets
- Temporary files
- Generated logs
- Local environments

Large datasets should generally use object storage or specialized data versioning systems.

## 4. Pipeline Version

A pipeline version identifies a specific state of pipeline code.

Example:

```text
vehicle-pipeline v1.0.0
```

It might contain:

```text
Extraction
Transformation
PostgreSQL Loading
```

## 5. Semantic Versioning

A common format is:

```text
MAJOR.MINOR.PATCH
```

Example:

```text
1.4.2
```

Meaning:

```text
1 = major version
4 = minor version
2 = patch
```

## 6. Major Changes

A major version may contain breaking changes.

Example:

```text
v1 → v2
```

The input schema changes:

```text
vehicle_id
speed
fuel
```

to:

```text
vehicle_id
speed
battery_level
```

Downstream systems may need modification.

## 7. Minor Changes

A minor version can introduce backward-compatible functionality.

Example:

```text
v1.2.0 → v1.3.0
```

New data validation may be added without breaking existing consumers.

## 8. Patch Changes

Patch releases usually contain fixes:

```text
v1.3.1
```

Example:

```text
Fix incorrect fuel conversion
```

## 9. Git Tags

Create a version tag:

```bash
git tag v1.0.0
```

Push it:

```bash
git push origin v1.0.0
```

List tags:

```bash
git tag
```

## 10. Data Pipeline Example

```text
v1.0.0
Initial vehicle pipeline
       |
       v
v1.1.0
Add data quality checks
       |
       v
v1.2.0
Add EV telemetry
       |
       v
v2.0.0
New source schema
```

## 11. Code vs Data Versioning

Git is excellent for source code.

Large datasets require different approaches.

```text
Code
 |
 +--> Git

Data
 |
 +--> Object Storage
 +--> Data Lake
 +--> Data Versioning Tools
```

Tools and technologies can include:

- Git LFS
- DVC
- Object storage
- Lakehouse table formats

## 12. Schema Versioning

Data pipelines should also consider schema changes.

Example:

```text
Version 1
vehicle_id
speed
fuel

Version 2
vehicle_id
speed
fuel
temperature
```

Schema changes should be documented and tested.

## 13. Reproducibility

A production result should ideally be traceable to:

```text
Code Version
+
Configuration Version
+
Input Data Version
+
Transformation Version
```

This improves debugging and auditing.

## 14. Automobile Example

A fleet pipeline may evolve:

```text
v1
Vehicle GPS
    |
v2
GPS + Speed
    |
v3
GPS + Speed + Battery
    |
v4
GPS + Speed + Battery + Temperature
```

Each change should be documented.

## 15. Best Practices

- Version pipeline code.
- Tag important releases.
- Document schema changes.
- Separate code and large data storage.
- Maintain migration strategies.
- Test backward compatibility where required.
- Record configuration versions.
- Make production deployments traceable.

## Interview Questions

1. Why should Data Engineering pipelines be versioned?
2. What is semantic versioning?
3. What is a breaking change?
4. How can Git tags version a pipeline?
5. Why should large datasets not normally be stored directly in Git?
6. What is schema versioning?
7. How does versioning improve reproducibility?

## Summary

Versioning allows Data Engineers to track pipeline evolution, reproduce previous versions, safely introduce changes, and investigate production issues.