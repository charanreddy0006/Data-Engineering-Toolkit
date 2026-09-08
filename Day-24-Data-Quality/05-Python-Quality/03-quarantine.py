from pathlib import Path
import pandas as pd

INPUT = Path("../examples/data/telemetry.csv")
OUT = Path("output")
OUT.mkdir(exist_ok=True)

df = pd.read_csv(INPUT)
valid = pd.Series(True, index=df.index)
reason = pd.Series("", index=df.index, dtype="string")

rules = [
    (df["vehicle_id"].notna(), "MISSING_VEHICLE_ID"),
    (df["event_id"].notna(), "MISSING_EVENT_ID"),
    (df["speed_kmh"].between(0, 350), "INVALID_SPEED"),
    (df["battery_soc"].between(0, 100), "INVALID_SOC"),
]

for mask, code in rules:
    failed = ~mask
    reason.loc[failed] = reason.loc[failed].where(
        reason.loc[failed].eq(""),
        reason.loc[failed] + ";"
    ) + code
    valid &= mask

df.loc[valid].to_csv(OUT / "valid_telemetry.csv", index=False)

bad = df.loc[~valid].copy()
bad["_dq_reason"] = reason.loc[~valid]
bad.to_csv(OUT / "quarantine_telemetry.csv", index=False)

print(f"valid={valid.sum()} quarantine={(~valid).sum()}")
