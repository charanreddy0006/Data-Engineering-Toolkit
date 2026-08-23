# 17 — Beginner Data Lake Example

## Goal

Convert a small CSV dataset into a validated Parquet dataset.

## Input

```csv
vehicle_id,timestamp,speed,battery
V001,2026-08-23T10:00:00,45,92
V002,2026-08-23T10:01:00,50,87
V003,2026-08-23T10:02:00,38,95
```

## Pipeline

```text
CSV
 |
 v
Pandas
 |
 v
Validation
 |
 v
Parquet
```

## Code

```python
import pandas as pd
from pathlib import Path

source = Path("data/raw/telemetry.csv")
target = Path("data/processed/telemetry.parquet")

df = pd.read_csv(source)

required = [
    "vehicle_id",
    "timestamp",
    "speed",
    "battery",
]

missing = [c for c in required if c not in df.columns]

if missing:
    raise ValueError(f"Missing columns: {missing}")

df = df.drop_duplicates()
df["timestamp"] = pd.to_datetime(df["timestamp"])

if (df["speed"] < 0).any():
    raise ValueError("Invalid speed")

if not df["battery"].between(0, 100).all():
    raise ValueError("Invalid battery value")

target.parent.mkdir(parents=True, exist_ok=True)
df.to_parquet(target, index=False)

print(f"Created {target}")
```

## Result

The processed dataset is smaller, typed, validated, and better suited for
analytical processing than the original CSV.
