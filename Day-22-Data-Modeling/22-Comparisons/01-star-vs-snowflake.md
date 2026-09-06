# Star vs Snowflake

Star:

```text
dim_vehicle
     |
dim_date - fact_trip - dim_customer
```

Snowflake:

```text
fact_trip
   |
dim_vehicle
   |
dim_model
   |
manufacturer
```

Star is generally easier for BI.

Snowflake can be useful for shared normalized hierarchies.

Choose based on workload, governance, and usability rather than ideology.
