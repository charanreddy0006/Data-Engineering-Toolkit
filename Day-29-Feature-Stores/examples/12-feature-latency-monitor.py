from dataclasses import dataclass
from datetime import datetime, timezone

@dataclass
class FeatureObservation:
    feature_name: str
    feature_time: datetime
    allowed_staleness_seconds: int

def staleness_seconds(obs: FeatureObservation) -> float:
    now = datetime.now(timezone.utc)
    return (now - obs.feature_time).total_seconds()

obs = FeatureObservation(
    "fault_count_24h",
    datetime.now(timezone.utc),
    900,
)

age = staleness_seconds(obs)
print({
    "feature": obs.feature_name,
    "age_seconds": round(age, 2),
    "within_sla": age <= obs.allowed_staleness_seconds,
})
