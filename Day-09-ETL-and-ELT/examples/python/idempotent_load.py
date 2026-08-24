import pandas as pd

incoming = pd.DataFrame(
    [
        ["E001", "V001", 80],
        ["E002", "V002", 90],
        ["E002", "V002", 90],
        ["E003", "V003", 75],
    ],
    columns=["event_id", "vehicle_id", "battery_pct"],
)

target = pd.DataFrame(
    [
        ["E001", "V001", 80],
    ],
    columns=["event_id", "vehicle_id", "battery_pct"],
)


def upsert(target_df, incoming_df):
    combined = pd.concat(
        [target_df, incoming_df],
        ignore_index=True,
    )

    combined = combined.drop_duplicates(
        subset=["event_id"],
        keep="last",
    )

    return combined.reset_index(drop=True)


first_run = upsert(target, incoming)
second_run = upsert(first_run, incoming)

print("After first run:")
print(first_run.to_string(index=False))

print("\nAfter running the same input again:")
print(second_run.to_string(index=False))

assert len(first_run) == len(second_run)
print("\nIdempotency check: PASS")
