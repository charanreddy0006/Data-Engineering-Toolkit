# dbt Command Reference

```bash
dbt debug
dbt deps
dbt seed
dbt run
dbt test
dbt build
dbt compile
dbt snapshot
dbt docs generate
```

Selection examples:

```bash
dbt build --select stg_service_records+
dbt run --select fct_service_cost
dbt test --select fct_service_cost
```

Use the current official documentation for version-specific syntax.
