from pathlib import Path
import pandas as pd

RAW = Path("data/raw/telemetry.csv")
PROCESSED = Path("data/processed/telemetry.parquet")

def validate(df: pd.DataFrame) -> pd.DataFrame:
    required = ["vehicle_id", "timestamp", "speed", "battery"]

    missing = [column for column in required if column not in df.columns]
    if missing:
        raise ValueError(f"Missing columns: {missing}")

    result = df.copy()
    result["timestamp"] = pd.to_datetime(result["timestamp"], errors="coerce")
    result["speed"] = pd.to_numeric(result["speed"], errors="coerce")
    result["battery"] = pd.to_numeric(result["battery"], errors="coerce")

    result = result.dropna(
        subset=["vehicle_id", "timestamp", "speed", "battery"]
    )

    result = result[result["speed"] >= 0]
    result = result[result["battery"].between(0, 100)]
    result = result.drop_duplicates(
        subset=["vehicle_id", "timestamp"]
    )

    return result

def main():
    df = pd.read_csv(RAW)
    clean = validate(df)

    PROCESSED.parent.mkdir(parents=True, exist_ok=True)
    clean.to_parquet(PROCESSED, index=False)

    print(f"Input rows: {len(df)}")
    print(f"Output rows: {len(clean)}")
    print(f"Output: {PROCESSED}")

if __name__ == "__main__":
    main()
