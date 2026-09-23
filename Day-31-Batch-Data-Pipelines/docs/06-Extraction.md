# 6. Data Extraction

## Methods

### Full extraction
Read all source rows.

### Incremental extraction
Read new or changed rows.

### CDC
Capture database changes.

## Metadata

Record:
- run ID
- extraction time
- source system
- row count
- watermark

## Example

```sql
SELECT *
FROM service_orders
WHERE updated_at > :last_watermark;
```

## Risks

- unreliable timestamps
- deletes
- duplicate reads
- clock differences
- source changes

Validate the meaning of the source change column before trusting it.
