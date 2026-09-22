import pandas as pd

def validate_vehicle_data(df: pd.DataFrame) -> None:
    required = {"vehicle_id", "distance_km", "battery_soc"}
    missing = required - set(df.columns)

    if missing:
        raise ValueError(f"Missing: {sorted(missing)}")
    if df["vehicle_id"].isna().any():
        raise ValueError("vehicle_id contains nulls")
    if (df["distance_km"] < 0).any():
        raise ValueError("distance cannot be negative")
    if ((df["battery_soc"] < 0) | (df["battery_soc"] > 100)).any():
        raise ValueError("battery_soc out of range")
