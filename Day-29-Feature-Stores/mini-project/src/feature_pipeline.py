from pathlib import Path
import pandas as pd

INPUT = Path("../../examples/sample_vehicle_events.csv")
OUTPUT = Path("vehicle_features.csv")

def main():
    df = pd.read_csv(INPUT)

    df["event_time"] = pd.to_datetime(df["event_time"], utc=True)
    df["distance_km"] = pd.to_numeric(df["distance_km"], errors="coerce").fillna(0)
    df["fault_code"] = df["fault_code"].fillna("")
    df["harsh_braking"] = df["harsh_braking"].astype(str).str.lower().eq("true")

    features = (
        df.groupby("vehicle_id")
          .agg(
              distance_km_total=("distance_km", "sum"),
              fault_count=("fault_code", lambda s: (s != "").sum()),
              harsh_braking_count=("harsh_braking", "sum"),
          )
          .reset_index()
    )

    features.to_csv(OUTPUT, index=False)
    print(features)

if __name__ == "__main__":
    main()
