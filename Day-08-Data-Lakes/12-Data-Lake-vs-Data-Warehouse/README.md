# 12 — Data Lake vs Data Warehouse

| Area | Data Lake | Data Warehouse |
|---|---|---|
| Data | Diverse | Mostly structured |
| Schema | Often schema-on-read | Strong schema |
| Storage | Object storage common | Managed warehouse |
| ML | Strong fit | Possible |
| BI | Possible | Excellent |
| Raw retention | Strong | Usually transformed |
| Flexibility | High | Controlled |

## Data Lake

Best when an organization needs flexible storage for diverse data and future
analytics.

## Warehouse

Best when business reporting needs highly modeled, governed, predictable data.

## Modern Architecture

They can work together.

```text
Sources
  |
  v
Data Lake
  |
  +----> ML
  |
  +----> Warehouse ----> BI
```

A data lake does not automatically replace a warehouse.
