def status(lag_seconds, threshold=30):
    return "LAGGING" if lag_seconds > threshold else "HEALTHY"

for lag in [2, 10, 45]:
    print(lag, status(lag))
