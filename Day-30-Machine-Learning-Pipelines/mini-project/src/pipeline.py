from pathlib import Path
import json
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import precision_score, recall_score, f1_score
import joblib

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / "examples" / "sample_vehicle_training.csv"
ARTIFACTS = Path(__file__).resolve().parent / "artifacts"
ARTIFACTS.mkdir(exist_ok=True)

FEATURES = [
    "distance_km_30d",
    "fault_count_24h",
    "fault_count_7d",
    "service_count_90d",
    "days_since_last_service",
    "battery_soc_latest",
]

def validate(df):
    required = {
        "vehicle_id", "prediction_date",
        "label_service_within_7d", *FEATURES
    }
    missing = required - set(df.columns)
    if missing:
        raise ValueError(f"Missing columns: {sorted(missing)}")

    if df[FEATURES].isna().any().any():
        raise ValueError("Feature dataset contains null values")

    if (df["distance_km_30d"] < 0).any():
        raise ValueError("Distance cannot be negative")

    if ((df["battery_soc_latest"] < 0) |
        (df["battery_soc_latest"] > 100)).any():
        raise ValueError("Battery SOC out of range")

def main():
    df = pd.read_csv(DATA)
    df["prediction_date"] = pd.to_datetime(
        df["prediction_date"], utc=True
    )
    validate(df)

    df = df.sort_values("prediction_date")
    split = int(len(df) * 0.67)

    train = df.iloc[:split]
    test = df.iloc[split:]

    model = RandomForestClassifier(
        n_estimators=100,
        random_state=42,
        class_weight="balanced",
    )
    model.fit(
        train[FEATURES],
        train["label_service_within_7d"],
    )

    predictions = model.predict(test[FEATURES])

    metrics = {
        "precision": float(
            precision_score(
                test["label_service_within_7d"],
                predictions,
                zero_division=0,
            )
        ),
        "recall": float(
            recall_score(
                test["label_service_within_7d"],
                predictions,
                zero_division=0,
            )
        ),
        "f1": float(
            f1_score(
                test["label_service_within_7d"],
                predictions,
                zero_division=0,
            )
        ),
    }

    joblib.dump(
        model,
        ARTIFACTS / "maintenance_model.joblib",
    )
    (ARTIFACTS / "metrics.json").write_text(
        json.dumps(metrics, indent=2),
        encoding="utf-8",
    )

    print(metrics)

if __name__ == "__main__":
    main()
