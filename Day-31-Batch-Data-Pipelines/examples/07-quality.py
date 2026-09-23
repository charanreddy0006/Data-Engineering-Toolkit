import pandas as pd

def validate(df: pd.DataFrame):
    required = {"service_order_id", "vehicle_id", "dealer_id", "amount"}
    missing = required - set(df.columns)
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")
    if df["service_order_id"].duplicated().any():
        raise ValueError("Duplicate service_order_id")
    if (df["amount"] < 0).any():
        raise ValueError("Negative amount")
