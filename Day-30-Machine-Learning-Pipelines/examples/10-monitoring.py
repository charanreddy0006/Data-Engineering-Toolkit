from dataclasses import dataclass

@dataclass
class Health:
    freshness_minutes: float
    prediction_count: int
    error_rate: float

def status(h: Health):
    if h.freshness_minutes > 60:
        return "STALE"
    if h.error_rate > 0.05:
        return "HIGH_ERROR_RATE"
    if h.prediction_count == 0:
        return "NO_PREDICTIONS"
    return "HEALTHY"

print(status(Health(15, 4000, 0.01)))
