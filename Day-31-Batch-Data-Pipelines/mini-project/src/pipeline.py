from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / "examples" / "sample_service_orders.csv"
OUTPUT = Path(__file__).resolve().parent / "output"

REQUIRED = {
    "service_order_id",
    "vehicle_id",
    "dealer_id",
    "service_date",
    "updated_at",
    "labor_amount",
    "parts_amount",
}

def validate(df):
    missing = REQUIRED - set(df.columns)
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")

    if df["service_order_id"].isna().any():
        raise ValueError("Missing service_order_id")

    if (df["labor_amount"] < 0).any():
        raise ValueError("Negative labor amount")

    if (df["parts_amount"] < 0).any():
        raise ValueError("Negative parts amount")

def main():
    df = pd.read_csv(INPUT)

    df["service_date"] = pd.to_datetime(df["service_date"])
    df["updated_at"] = pd.to_datetime(df["updated_at"], utc=True)

    validate(df)

    # Keep the latest version of each source record.
    df = (
        df.sort_values("updated_at")
          .drop_duplicates("service_order_id", keep="last")
    )

    df["service_revenue"] = (
        df["labor_amount"] + df["parts_amount"]
    )

    result = (
        df.groupby(["service_date", "dealer_id"], as_index=False)
          .agg(
              service_orders=("service_order_id", "count"),
              service_revenue=("service_revenue", "sum"),
          )
    )

    OUTPUT.mkdir(exist_ok=True)
    result.to_csv(
        OUTPUT / "daily_service_revenue.csv",
        index=False,
    )

    print(result)

if __name__ == "__main__":
    main()
