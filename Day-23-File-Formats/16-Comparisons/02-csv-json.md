# CSV vs JSON

## CSV

Best for flat tables and broad tabular interoperability.

```csv
vehicle_id,model,powertrain
V100,VoltX,BEV
```

## JSON

Best for nested application payloads.

```json
{
  "vehicle_id": "V100",
  "location": {
    "lat": 12.97,
    "lon": 77.59
  }
}
```

## Decision

Use CSV when the data is naturally tabular and simplicity is valuable.

Use JSON when nested structure and API interoperability are important.

Neither should automatically become the final format for a huge analytical lake.
