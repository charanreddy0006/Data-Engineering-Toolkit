import pandas as pd

def deduplicate(df: pd.DataFrame) -> pd.DataFrame:
    work = df.sort_values(
        ["event_id", "ingestion_time"],
        ascending=[True, False],
    )
    return work.drop_duplicates(
        subset=["event_id"],
        keep="first",
    ).reset_index(drop=True)

if __name__ == "__main__":
    sample = pd.DataFrame([
        {"event_id": "E1", "ingestion_time": "10:01", "speed_kmh": 50},
        {"event_id": "E1", "ingestion_time": "10:02", "speed_kmh": 52},
        {"event_id": "E2", "ingestion_time": "10:03", "speed_kmh": 60},
    ])
    print(deduplicate(sample))
