import json
from datetime import datetime, timezone

def make_event(event_id, vehicle_id, fault_code, severity):
    return {
        "event_id":event_id,
        "vehicle_id":vehicle_id,
        "event_time":datetime.now(timezone.utc).isoformat(),
        "fault_code":fault_code,
        "severity":severity,
    }

print(json.dumps(make_event("E1001","V1001","P0420","HIGH")))
