import pandas as pd

FEATURES = [
    "distance_km_30d",
    "fault_count_24h",
    "fault_count_7d",
]

df = pd.read_csv("vehicle_features.csv")
# Demonstration scoring formula only.
df["risk_score"] = (
    0.001 * df["distance_km_30d"]
    + 0.10 * df["fault_count_24h"]
    + 0.05 * df["fault_count_7d"]
)
df["model_version"] = "maintenance-risk-v1"
df.to_csv("vehicle_predictions.csv", index=False)
