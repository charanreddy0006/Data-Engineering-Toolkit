import pandas as pd

def validate(df: pd.DataFrame) -> list[str]:
    errors = []

    if df["vehicle_id"].isna().any():
        errors.append("vehicle_id contains nulls")

    if (df["distance_km_total"] < 0).any():
        errors.append("distance cannot be negative")

    if (df["fault_count"] < 0).any():
        errors.append("fault count cannot be negative")

    if (df["harsh_braking_count"] < 0).any():
        errors.append("harsh braking count cannot be negative")

    return errors

if __name__ == "__main__":
    df = pd.read_csv("vehicle_features.csv")
    errors = validate(df)
    if errors:
        raise SystemExit("\n".join(errors))
    print("Feature quality checks passed.")
