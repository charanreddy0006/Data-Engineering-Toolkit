# Star vs Snowflake

| Area | Star | Snowflake |
|---|---|---|
| BI simplicity | High | Moderate |
| Join count | Lower | Higher |
| Dimension redundancy | Higher | Lower |
| Self-service | Easier | Harder |
| Hierarchy normalization | Limited | Strong |
| Typical use | Consumption | Selective |

## Practical approach

Start with a star.

Normalize a dimension only when there is a concrete reason:

- very large hierarchy;
- shared master data;
- governance;
- measured storage/query trade-off.

## Automobile example

`dim_vehicle` can contain model attributes for easy reporting.

If manufacturer master data is shared by dozens of domains, a separate governed hierarchy may be
appropriate.
