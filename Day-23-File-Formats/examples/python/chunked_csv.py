import pandas as pd

for chunk_id, chunk in enumerate(
    pd.read_csv(
        "large_telemetry.csv",
        chunksize=100_000,
    )
):
    if chunk["event_id"].duplicated().any():
        raise ValueError(f"Duplicate IDs in chunk {chunk_id}")

    chunk.to_parquet(
        f"output/part-{chunk_id:05d}.parquet",
        compression="zstd",
        index=False,
    )

    print(chunk_id, len(chunk))
