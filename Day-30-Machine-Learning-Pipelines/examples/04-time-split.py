import pandas as pd

def time_split(df: pd.DataFrame, timestamp: str, cutoff: str):
    data = df.sort_values(timestamp)
    cutoff_ts = pd.Timestamp(cutoff, tz="UTC")
    train = data[data[timestamp] < cutoff_ts]
    test = data[data[timestamp] >= cutoff_ts]
    return train, test
