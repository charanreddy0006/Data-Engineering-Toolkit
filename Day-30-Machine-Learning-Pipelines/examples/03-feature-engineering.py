import pandas as pd

def build_features(df: pd.DataFrame) -> pd.DataFrame:
    out = df.copy()
    out["energy_per_100km"] = (
        out["energy_kwh"] / out["distance_km"].clip(lower=0.001)
    ) * 100
    out["high_fault_vehicle"] = (
        out["fault_count_24h"] >= 3
    ).astype(int)
    return out
