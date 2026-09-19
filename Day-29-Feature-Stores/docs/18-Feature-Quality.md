# 18. Feature Quality

## Dimensions

### Validity
Value follows expected rules.

### Completeness
Expected values are present.

### Uniqueness
No unintended duplicate entity/time records.

### Consistency
Same concept is represented consistently.

### Accuracy
Values reflect reality closely enough for their use.

### Freshness
Values arrive within the defined window.

## Example Rules

```text
battery_soc BETWEEN 0 AND 100
distance_km >= 0
service_count_90d >= 0
vehicle_id IS NOT NULL
```

## Distribution Checks

Monitor:
- mean
- standard deviation
- quantiles
- missing percentage
- cardinality

## Automobile Example

If average battery state suddenly changes from 55% to 3% across the fleet, investigate source or transformation issues before allowing a model pipeline to consume the feature.
