# Factless Facts

A factless fact records an event without numeric measures.

Example:

```text
vehicle_feature_activation
vehicle_key
feature_key
date_key
```

The row itself means:

> This feature was activated for this vehicle on this date.

## Automobile examples

- vehicle entered recall program;
- driver enrolled in connected services;
- safety feature activated;
- vehicle entered dealer network.

## Query

```sql
SELECT feature_key, COUNT(*)
FROM fact_feature_activation
GROUP BY feature_key;
```

Do not invent a meaningless numeric measure simply to make an event look like a traditional fact.
