def validate_requirements(req):
    required = {
        "volume", "latency", "retention",
        "availability", "security", "cost"
    }
    missing = required - set(req)
    if missing:
        raise ValueError(f"Missing requirements: {sorted(missing)}")

requirements = {
    "volume": "high",
    "latency": "low",
    "retention": "5y",
    "availability": "high",
    "security": "required",
    "cost": "controlled",
}
validate_requirements(requirements)
print("Requirements complete")
