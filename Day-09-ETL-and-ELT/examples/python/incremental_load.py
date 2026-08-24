import pandas as pd
from datetime import datetime

source = pd.DataFrame(
    [
        ["E001", "V001", "2026-08-24 09:00:00"],
        ["E002", "V002", "2026-08-24 09:15:00"],
        ["E003", "V003", "2026-08-24 09:30:00"],
        ["E004", "V004", "2026-08-24 09:45:00"],
    ],
    columns=["event_id", "vehicle_id", "updated_at"],
)

source["updated_at"] = pd.to_datetime(source["updated_at"])

watermark = datetime.fromisoformat(
    "2026-08-24 09:20:00"
)

changed = source[
    source["updated_at"] > watermark
].copy()

changed = changed.drop_duplicates(
    subset=["event_id"]
)

if changed.empty:
    new_watermark = watermark
else:
    new_watermark = max(
        watermark,
        changed["updated_at"].max()
    )

print("Old watermark:", watermark)
print("\nChanged records:")
print(changed.to_string(index=False))
print("\nNew watermark:", new_watermark)

# Production rule:
# Commit the new watermark only after the destination load succeeds.
