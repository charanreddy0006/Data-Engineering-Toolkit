import json
from pathlib import Path
import pandas as pd

source = Path("telemetry.jsonl")
output = Path("telemetry.parquet")

records = []
bad = []

with source.open(encoding="utf-8") as f:
    for line_number, line in enumerate(f, start=1):
        if not line.strip():
            continue

        try:
            event = json.loads(line)

            if not event.get("event_id"):
                raise ValueError("missing event_id")

            soc = event.get("battery_soc")
            if soc is not None and not 0 <= float(soc) <= 100:
                raise ValueError("battery_soc outside 0..100")

            speed = event.get("speed_kph")
            if speed is not None and float(speed) < 0:
                raise ValueError("negative speed")

            records.append(event)

        except (json.JSONDecodeError, TypeError, ValueError) as exc:
            bad.append({
                "line_number": line_number,
                "reason": str(exc),
            })

pd.DataFrame(records).to_parquet(
    output,
    compression="zstd",
    index=False,
)

pd.DataFrame(bad).to_csv("quarantine.csv", index=False)

print("valid:", len(records))
print("invalid:", len(bad))
