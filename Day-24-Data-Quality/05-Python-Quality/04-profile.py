from pathlib import Path
import pandas as pd

INPUT = Path("../examples/data/telemetry.csv")

df = pd.read_csv(INPUT)

rows = []
for column in df.columns:
    s = df[column]
    rows.append({
        "column": column,
        "dtype": str(s.dtype),
        "rows": len(s),
        "nulls": int(s.isna().sum()),
        "null_pct": float(s.isna().mean() * 100),
        "distinct": int(s.nunique(dropna=True)),
    })

print(pd.DataFrame(rows).to_string(index=False))
