import csv
import os
from datetime import datetime

REQUIRED = {
    "event_id",
    "vehicle_id",
    "timestamp",
    "speed_kph",
    "battery_pct",
    "engine_temp_c",
}


def validate(row):
    missing = REQUIRED - set(row)
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")

    if not row["event_id"] or not row["vehicle_id"]:
        raise ValueError("Identifiers are required")

    datetime.fromisoformat(row["timestamp"].replace("Z", "+00:00"))

    speed = float(row["speed_kph"])
    battery = float(row["battery_pct"])

    if speed < 0:
        raise ValueError("speed_kph cannot be negative")

    if not 0 <= battery <= 100:
        raise ValueError("battery_pct must be between 0 and 100")


def main():
    path = os.getenv("INPUT_FILE", "telemetry.csv")
    accepted = rejected = 0

    with open(path, newline="", encoding="utf-8") as handle:
        for row in csv.DictReader(handle):
            try:
                validate(row)
                accepted += 1
            except ValueError as exc:
                rejected += 1
                print("REJECTED:", exc)

    print(f"accepted={accepted} rejected={rejected}")


if __name__ == "__main__":
    main()
