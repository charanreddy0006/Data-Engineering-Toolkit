from pathlib import Path
import pandas as pd

source = Path("vehicles.csv")
target = Path("vehicles.parquet")

df = pd.read_csv(
    source,
    dtype={
        "vehicle_id": "string",
        "vin": "string",
        "model": "string",
        "powertrain": "string",
        "model_year": "Int64",
    },
)

required = {"vehicle_id", "vin", "model", "powertrain", "model_year"}
missing = required - set(df.columns)

if missing:
    raise ValueError(f"Missing columns: {sorted(missing)}")

if df["vehicle_id"].isna().any():
    raise ValueError("vehicle_id contains NULL")

if df["vehicle_id"].duplicated().any():
    raise ValueError("Duplicate vehicle_id")

df.to_parquet(target, compression="zstd", index=False)

print(f"Rows written: {len(df)}")
