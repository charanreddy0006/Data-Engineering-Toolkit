# Day 11 Diagrams

```text
Raw Data
   |
   v
Staging
   |
   v
Intermediate
   |
   +------+
   |      |
   v      v
Dimension Fact
   |      |
   +--+---+
      |
      v
     BI
```

Production:

```text
Git -> CI -> dbt Build/Test -> Production Warehouse -> BI/ML
                    ^
                    |
                 Airflow
```
