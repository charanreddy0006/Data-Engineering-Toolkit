from pathlib import Path
import pandas as pd
import joblib

ROOT = Path(__file__).resolve().parents[2]
MODEL = Path(__file__).resolve().parent / "artifacts" / "maintenance_model.joblib"
DATA = ROOT / "examples" / "sample_vehicle_training.csv"

FEATURES = [
    "distance_km_30d",
    "fault_count_24h",
    "fault_count_7d",
    "service_count_90d",
    "days_since_last_service",
    "battery_soc_latest",
]

def main():
    model = joblib.load(MODEL)
    df = pd.read_csv(DATA)

    df["risk_score"] = model.predict_proba(
        df[FEATURES]
    )[:, 1]

    df["model_version"] = "maintenance-risk-v1"

    output = Path(__file__).resolve().parent / "predictions.csv"
    df[
        ["vehicle_id", "risk_score", "model_version"]
    ].to_csv(output, index=False)

    print(output)

if __name__ == "__main__":
    main()
