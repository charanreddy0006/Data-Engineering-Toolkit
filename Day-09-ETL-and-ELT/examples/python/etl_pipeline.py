from pathlib import Path
import pandas as pd

BASE = Path(__file__).resolve().parents[1]
SOURCE = BASE / "data" / "service_raw.csv"
CURATED = BASE / "data" / "service_curated.csv"
SUMMARY = BASE / "data" / "vehicle_service_summary.csv"
QUARANTINE = BASE / "data" / "service_quarantine.csv"

REQUIRED = {
    "service_id", "vehicle_id", "service_date",
    "service_type", "service_cost", "updated_at"
}


def extract():
    if not SOURCE.exists():
        raise FileNotFoundError(SOURCE)

    df = pd.read_csv(SOURCE)
    print("Extracted rows:", len(df))
    return df


def validate_schema(df):
    missing = REQUIRED - set(df.columns)
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")


def validate_records(df):
    work = df.copy()
    work["service_date"] = pd.to_datetime(
        work["service_date"], errors="coerce"
    )
    work["service_cost"] = pd.to_numeric(
        work["service_cost"], errors="coerce"
    )

    invalid = (
        work["service_id"].isna()
        | work["vehicle_id"].isna()
        | work["service_date"].isna()
        | work["service_cost"].isna()
        | (work["service_cost"] < 0)
    )

    return work.loc[~invalid].copy(), work.loc[invalid].copy()


def transform(df):
    result = df.copy()

    result["vehicle_id"] = (
        result["vehicle_id"].astype(str).str.strip().str.upper()
    )

    result["service_type"] = (
        result["service_type"]
        .fillna("UNKNOWN")
        .astype(str)
        .str.strip()
        .str.upper()
    )

    result = result.drop_duplicates(
        subset=["service_id"], keep="last"
    )

    result["cost_category"] = pd.cut(
        result["service_cost"],
        [-1, 500, 2000, float("inf")],
        labels=["LOW", "MEDIUM", "HIGH"],
    )

    return result


def aggregate(df):
    return (
        df.groupby("vehicle_id", as_index=False)
        .agg(
            service_count=("service_id", "count"),
            total_service_cost=("service_cost", "sum"),
            average_service_cost=("service_cost", "mean"),
            last_service_date=("service_date", "max"),
        )
    )


def load(curated, summary, invalid):
    CURATED.parent.mkdir(parents=True, exist_ok=True)
    curated.to_csv(CURATED, index=False)
    summary.to_csv(SUMMARY, index=False)

    if not invalid.empty:
        invalid.to_csv(QUARANTINE, index=False)

    print("Curated:", CURATED)
    print("Summary:", SUMMARY)


def main():
    raw = extract()
    validate_schema(raw)

    valid, invalid = validate_records(raw)
    curated = transform(valid)
    summary = aggregate(curated)

    load(curated, summary, invalid)

    print("Raw:", len(raw))
    print("Valid:", len(curated))
    print("Rejected:", len(invalid))
    print("Vehicles:", len(summary))


if __name__ == "__main__":
    main()
