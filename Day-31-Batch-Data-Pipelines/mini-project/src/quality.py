from pathlib import Path
import pandas as pd

OUTPUT = (
    Path(__file__).resolve().parent
    / "output"
    / "daily_service_revenue.csv"
)

def main():
    df = pd.read_csv(OUTPUT)

    if df.empty:
        raise ValueError("Output is empty")

    if df["dealer_id"].isna().any():
        raise ValueError("dealer_id contains nulls")

    if (df["service_orders"] < 0).any():
        raise ValueError("Invalid service order count")

    if (df["service_revenue"] < 0).any():
        raise ValueError("Negative service revenue")

    print("Quality checks passed.")

if __name__ == "__main__":
    main()
