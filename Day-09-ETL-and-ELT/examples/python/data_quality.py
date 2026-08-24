import pandas as pd

data = pd.DataFrame(
    {
        "event_id": ["E001", "E002", "E002", "E004"],
        "vehicle_id": ["V001", "V002", None, "V004"],
        "speed_kmh": [45, 80, -10, 250],
        "battery_pct": [90, 80, 110, 65],
    }
)


def quality_report(df):
    report = {}

    report["rows"] = len(df)
    report["missing_vehicle_id"] = int(
        df["vehicle_id"].isna().sum()
    )
    report["duplicate_event_id"] = int(
        df["event_id"].duplicated().sum()
    )
    report["invalid_speed"] = int(
        (~df["speed_kmh"].between(0, 220)).sum()
    )
    report["invalid_battery"] = int(
        (~df["battery_pct"].between(0, 100)).sum()
    )

    total = df.shape[0] * df.shape[1]
    missing = int(df.isna().sum().sum())

    report["completeness"] = (
        round(1 - missing / total, 4)
        if total else 1
    )

    return report


report = quality_report(data)

print("DATA QUALITY REPORT")
print("=" * 30)

for key, value in report.items():
    print(f"{key:25} {value}")

failures = (
    report["missing_vehicle_id"]
    + report["duplicate_event_id"]
    + report["invalid_speed"]
    + report["invalid_battery"]
)

print("\nSTATUS:", "PASS" if failures == 0 else "FAIL")
