# 9. Incremental Loads

Incremental pipelines process only new or changed data.

```text
Last Success
    ↓
Determine Window
    ↓
Extract Changes
    ↓
Transform
    ↓
Merge / Append
```

## Change columns

- created_at
- updated_at
- sequence ID
- source timestamp

## Benefits
- lower data movement
- lower compute
- shorter runtime

## Challenges
- deletes
- late updates
- duplicates
- failed-run recovery

## Automobile

Process service orders updated since the previous successful load.
