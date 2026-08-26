# 05 dbt Architecture

## Day 11 — dbt

## 1. Introduction

dbt is a transformation and analytics-engineering tool used to build
repeatable, testable, documented analytical datasets. It normally executes
SQL against a supported warehouse or lakehouse rather than replacing that
platform.

The central workflow is:

```text
Source Data
    |
    v
Staging Models
    |
    v
Intermediate Models
    |
    v
Business Marts
    |
    +----> BI
    +----> ML
    +----> Applications
```

dbt brings software-engineering practices to analytical SQL:

- version control
- code review
- dependency management
- reusable macros
- automated tests
- documentation
- lineage
- repeatable deployments
- incremental processing

## 2. Why dbt Exists

Without a transformation framework, teams often accumulate independent SQL
scripts, scheduled queries, undocumented tables and duplicated business logic.
As the number of datasets increases, it becomes difficult to know where a
metric came from, what depends on it, and whether a change is safe.

dbt addresses this by treating analytical transformation as code.

```text
Raw Data
   |
   v
dbt Project
   |
   +--> Models
   +--> Tests
   +--> Documentation
   +--> Macros
   +--> Lineage
   |
   v
Trusted Data
```

## 3. Core Concepts

### Models

A model is usually a SQL select statement that dbt materializes as a view,
table, incremental relation or other supported form.

```sql
select
    vehicle_id,
    service_date,
    cost
from {{ ref('stg_service_records') }}
```

### Sources

Sources describe upstream tables that already exist outside the dbt model
graph.

```sql
select *
from {{ source('automotive', 'service_records') }}
```

### ref()

`ref()` declares a dependency on another dbt model. This allows dbt to build a
directed dependency graph.

### Tests

Tests verify assumptions such as uniqueness, non-null values and relationships.

### Documentation

Documentation captures technical and business meaning for models and columns.

### Lineage

Lineage explains how upstream datasets flow into downstream datasets.

## 4. Architecture

```text
                   Git Repository
                         |
                         v
                    dbt Project
                         |
              +----------+----------+
              |          |          |
            Models     Tests      Macros
              |          |          |
              +----------+----------+
                         |
                         v
               Warehouse / Lakehouse
                         |
                +--------+--------+
                |                 |
                v                 v
          Analytical Marts   Documentation
                |
             +--+--+
             |     |
             v     v
            BI     ML
```

The underlying warehouse or processing engine executes the SQL. dbt manages
the definitions, dependencies, testing and documentation around that SQL.

## 5. Professional Project Structure

```text
automotive_dbt/
|
+-- dbt_project.yml
+-- models/
|   +-- staging/
|   |   +-- stg_service_records.sql
|   |   +-- sources.yml
|   +-- intermediate/
|   |   +-- int_vehicle_service.sql
|   +-- marts/
|       +-- dim_vehicle.sql
|       +-- fct_service_cost.sql
|
+-- seeds/
+-- snapshots/
+-- macros/
+-- tests/
+-- analyses/
```

A clean structure makes ownership and dependencies easier to understand.

## 6. Automobile Industry Example

An automobile company may receive service transactions from dealer systems.

```text
Dealer Service DB
       |
       v
raw.service_records
       |
       v
stg_service_records
       |
       v
int_vehicle_service
      /      /       v     v
dim_vehicle  fct_service_cost
      \     /
       \   /
        v v
     BI Dashboard
```

Example staging SQL:

```sql
select
    service_id,
    upper(trim(vehicle_id)) as vehicle_id,
    cast(service_date as date) as service_date,
    trim(service_type) as service_type,
    cast(cost as numeric(12,2)) as cost
from {{ source('automotive', 'service_records') }}
where service_id is not null
```

Example business model:

```sql
select
    vehicle_id,
    count(*) as service_count,
    sum(cost) as total_service_cost,
    avg(cost) as average_service_cost
from {{ ref('stg_service_records') }}
group by vehicle_id
```

## 7. Data Quality

Data quality should be treated as part of the transformation contract.

Typical rules include:

```text
service_id       -> not null + unique
vehicle_id       -> not null
service_date     -> valid date
cost             -> not null + non-negative
service_type     -> accepted business value
```

Example YAML:

```yaml
version: 2

models:
  - name: stg_service_records
    columns:
      - name: service_id
        tests:
          - not_null
          - unique
      - name: vehicle_id
        tests:
          - not_null
      - name: cost
        tests:
          - not_null
```

Custom business test:

```sql
select *
from {{ ref('stg_service_records') }}
where cost < 0
```

A test should fail when invalid rows are returned.

## 8. Jinja and Macros

Jinja makes SQL dynamic and reusable.

Example macro:

```sql
{% macro normalize_vehicle_id(column_name) %}
    upper(trim({{ column_name }}))
{% endmacro %}
```

Usage:

```sql
select
    {{ normalize_vehicle_id('vehicle_id') }} as vehicle_id
from {{ ref('stg_service_records') }}
```

Macros should eliminate repeated patterns without making the project harder to
read.

## 9. Materializations

Important materialization choices include:

```text
view
table
incremental
ephemeral
```

Use a view when computation is inexpensive and dynamic results are acceptable.
Use a table when repeated downstream queries would benefit from persisted
results. Use incremental processing when rebuilding the entire dataset is
unnecessarily expensive.

## 10. Incremental Model

Conceptual example:

```sql
{{ config(
    materialized='incremental',
    unique_key='service_id'
) }}

select
    service_id,
    vehicle_id,
    service_date,
    cost
from {{ source('automotive', 'service_records') }}

{% if is_incremental() %}
where service_date >= (
    select coalesce(max(service_date), '1900-01-01')
    from {{ this }}
)
{% endif %}
```

Production incremental models must account for late-arriving data, updates,
deletes, unique keys and the incremental strategy supported by the target
platform.

## 11. Testing Strategy

A mature project can use several layers:

```text
Source Checks
      |
      v
Schema Tests
      |
      v
Custom Business Tests
      |
      v
Freshness / Operational Checks
      |
      v
Production Monitoring
```

Testing should answer whether the data is structurally valid and whether it
makes business sense.

## 12. Performance

dbt performance depends on the underlying warehouse or lakehouse.

Useful practices:

- select required columns
- filter early
- avoid unnecessary joins
- choose materializations deliberately
- use incremental processing for suitable workloads
- reduce repeated expensive calculations
- inspect query plans
- monitor warehouse cost
- partition or cluster according to platform capabilities

dbt organizes transformation logic; the data platform performs the query.

## 13. CI/CD

A professional workflow can look like:

```text
Feature Branch
      |
      v
Pull Request
      |
      v
Compile + Build + Test
      |
      v
Code Review
      |
      v
Merge
      |
      v
Production Deployment
```

CI should catch broken SQL, dependency problems and failed data assumptions
before production.

## 14. Security

Never commit production passwords, API keys or database tokens.

Use:

- environment variables
- secrets managers
- managed credentials
- separate development and production roles
- least-privilege access
- audit logging

The dbt project should contain configuration patterns, not exposed secrets.

## 15. Common Mistakes

1. Creating one enormous model.
2. Using `select *` everywhere.
3. Ignoring failed tests.
4. Hard-coding credentials.
5. Using incremental logic without understanding updates.
6. Building every model as a table.
7. Making macros unnecessarily complicated.
8. Treating dbt as an orchestration platform.
9. Not documenting business metrics.
10. Running expensive full refreshes unnecessarily.
11. Allowing production changes without review.
12. Forgetting source freshness.

## 16. Best Practices

- Use meaningful names.
- Keep staging models focused on standardization.
- Use `source()` for external sources.
- Use `ref()` for dbt dependencies.
- Add tests to important columns.
- Document business-facing models.
- Keep SQL readable.
- Use incremental models when justified.
- Use Git and pull requests.
- Separate environments.
- Monitor freshness and failures.
- Make transformations reproducible.
- Keep secrets outside source control.

## 17. Integration With the Data Platform

```text
Kafka
  |
  v
Raw Storage / Warehouse <--- PostgreSQL
  |
  v
dbt
  |
  +--> Staging
  +--> Intermediate
  +--> Marts
  +--> Tests
  +--> Documentation
  |
  v
BI / ML

Airflow
  |
  +--> coordinates dbt
  +--> coordinates Spark
  +--> coordinates ingestion
```

Airflow coordinates workflow execution. dbt performs SQL transformation.

Spark can perform large distributed computations when SQL execution in the
analytical platform is not appropriate.

## 18. Practical Exercise

Build:

```text
stg_service_records
        |
        v
int_vehicle_service
       /       v   v
dim_vehicle   fct_service_cost
```

Then add:

- source definitions
- uniqueness tests
- not-null tests
- positive-cost test
- documentation
- incremental model
- Git workflow
- CI validation

## 19. Interview Questions

### Beginner

1. What is dbt?
2. What is a model?
3. What is `ref()`?
4. What is `source()`?
5. What are seeds?
6. What are snapshots?
7. What are tests?

### Intermediate

8. Explain materializations.
9. Explain incremental models.
10. What is Jinja?
11. What are macros?
12. How does dbt create lineage?
13. Why are staging models useful?
14. How do you document a model?

### Advanced

15. How do you handle late-arriving records?
16. How would you optimize an incremental model?
17. How would you design dbt CI/CD?
18. How does dbt work with Airflow?
19. How do you separate development and production?
20. How do you prevent duplicate records?

## 20. Key Takeaways

dbt is an analytics-engineering layer that makes analytical transformation
more maintainable.

The production mindset is:

```text
Source
  |
  v
Transform
  |
  v
Test
  |
  v
Document
  |
  v
Deploy
  |
  v
Monitor
```

For the automobile platform, dbt owns analytical SQL transformations and data
quality while specialized technologies own ingestion, streaming, storage,
distributed computation, orchestration and visualization.

## 21. Revision Checklist

- [ ] dbt purpose
- [ ] analytics engineering
- [ ] projects
- [ ] models
- [ ] sources
- [ ] seeds
- [ ] snapshots
- [ ] tests
- [ ] documentation
- [ ] lineage
- [ ] ref()
- [ ] source()
- [ ] Jinja
- [ ] macros
- [ ] variables
- [ ] configurations
- [ ] materializations
- [ ] incremental models
- [ ] environments
- [ ] packages
- [ ] CI/CD
- [ ] Airflow integration
- [ ] warehouse integration
- [ ] automobile use case
