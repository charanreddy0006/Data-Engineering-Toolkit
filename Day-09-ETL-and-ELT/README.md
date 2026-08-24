# Day 09 — ETL and ELT

## Objective

Learn how data is extracted from source systems, transformed into useful
information and loaded into analytical destinations.

## Main learning path

```text
Sources
  |
  v
Extract
  |
  v
Raw / Staging
  |
  v
Validate
  |
  v
Transform
  |
  v
Load
  |
  v
Curated Data
  |
  +------> BI
  |
  +------> ML
```

## Topics

1. Introduction
2. ETL vs ELT
3. Why ETL/ELT exists
4. History
5. ETL architecture
6. ELT architecture
7. Extraction
8. Transformation
9. Loading
10. Batch processing
11. Incremental loading
12. CDC
13. Full vs incremental
14. Validation
15. Cleansing
16. Deduplication
17. Standardization
18. Enrichment
19. Error handling
20. Idempotency
21. Retry and recovery
22. Lineage
23. Metadata
24. Data quality
25. Orchestration
26. Data lakes
27. Warehouses
28. Python
29. SQL
30. PySpark
31. Airflow
32. dbt
33. Performance
34. Partitioning
35. Parallelism
36. Security
37. Governance
38. Monitoring
39. Cost optimization
40. Automobile ETL
41. Real-world architecture
42. Common mistakes
43. Best practices
44. Interview preparation
45. Cheat sheet
46. Official documentation
47. Additional resources
48. Mini project
49. End-to-end project

## Automobile portfolio project

```text
Vehicle Sensors ----Service Database ----> Ingestion -> Raw Lake -> Quality
Warranty System ----/                           |
Vehicle Master -----/                           v
                                         Spark / SQL
                                              |
                                              v
                                      Curated Data
                                         /                                             /                                              v         v
                                      BI         ML
```

The repository uses automobile examples so every concept can be connected to a
real business scenario such as predictive maintenance, warranty analysis,
service analytics and fleet health.

## Production principles

- Preserve raw data when replay is valuable.
- Use incremental processing for large changing sources.
- Validate before publishing trusted data.
- Make writes idempotent.
- Separate bad records from infrastructure failures.
- Use retries with limits and backoff.
- Monitor both pipeline execution and data quality.
- Keep secrets out of Git.
- Document ownership and transformations.
- Test reruns and failure scenarios.
