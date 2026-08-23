# 16 — Professional Project Structure

```text
automotive-data-lake/
├── data/
│   ├── raw/
│   ├── processed/
│   ├── curated/
│   └── quarantine/
├── src/
│   ├── ingestion/
│   ├── validation/
│   ├── transformation/
│   └── utils/
├── pipelines/
├── tests/
├── notebooks/
├── configs/
├── docs/
├── requirements.txt
└── README.md
```

## Principles

Keep source code separate from data.

Do not commit large generated datasets to Git.

Keep configuration separate from implementation.

Place tests close to the logic they validate.

Use notebooks for exploration and source modules for reusable production logic.

## Example

```text
src/transformation/telemetry.py
tests/test_telemetry.py
data/raw/telemetry/
data/processed/telemetry/
```
