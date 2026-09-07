# CSV with Python — Hands-On

Python's `csv` module is appropriate for controlled CSV processing.

```python
import csv

with open("vehicles.csv", newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)

    expected = {"vehicle_id", "vin", "model", "powertrain", "model_year"}
    actual = set(reader.fieldnames or [])

    missing = expected - actual
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")

    for row_number, row in enumerate(reader, start=2):
        vehicle_id = row["vehicle_id"].strip()

        if not vehicle_id:
            raise ValueError(f"Missing vehicle_id on line {row_number}")

        model_year = int(row["model_year"])

        if not 1980 <= model_year <= 2100:
            raise ValueError(f"Invalid model year on line {row_number}")

        print(vehicle_id, model_year)
```

## Writing

```python
rows = [
    {"vehicle_id": "V100", "model": "VoltX"},
    {"vehicle_id": "V101", "model": "DriveH"},
]

with open("vehicles_out.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=rows[0].keys())
    writer.writeheader()
    writer.writerows(rows)
```

## Large files

Iterate instead of calling `read()` on a multi-gigabyte file.

## Production metadata

Capture:

```text
source_file
ingestion_time
row_count
schema_version
validation_status
```

## Automobile rule

VIN and vehicle IDs should be treated as identifiers, not blindly inferred as numbers.
