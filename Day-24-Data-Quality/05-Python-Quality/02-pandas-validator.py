from pathlib import Path
import pandas as pd

INPUT = Path("../examples/data/telemetry.csv")

def validate(df: pd.DataFrame) -> dict[str, float]:
    total = len(df)
    if total == 0:
        raise ValueError("Input is empty")

    return {
        "vehicle_id_completeness_pct": 100 * df["vehicle_id"].notna().mean(),
        "event_time_completeness_pct": 100 * df["event_time"].notna().mean(),
        "speed_validity_pct": 100 * df["speed_kmh"].between(0, 350).mean(),
        "soc_validity_pct": 100 * df["battery_soc"].between(0, 100).mean(),
        "event_id_uniqueness_pct": 100 * df["event_id"].nunique() / total,
    }

if __name__ == "__main__":
    df = pd.read_csv(INPUT)
    metrics = validate(df)
    for name, value in metrics.items():
        print(f"{name}: {value:.3f}")
