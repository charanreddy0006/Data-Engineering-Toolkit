from collections import defaultdict

seen=set()
counts=defaultdict(int)

def process(event):
    event_id=event["event_id"]
    if event_id in seen:
        return None
    seen.add(event_id)
    vehicle=event["vehicle_id"]
    counts[vehicle]+=1
    return {
        "vehicle_id": vehicle,
        "fault_count": counts[vehicle],
        "last_fault_code": event["fault_code"]
    }

events=[
    {"event_id":"E1","vehicle_id":"V1001","fault_code":"P0420"},
    {"event_id":"E1","vehicle_id":"V1001","fault_code":"P0420"},
    {"event_id":"E2","vehicle_id":"V1001","fault_code":"P0301"},
]
for e in events:
    result=process(e)
    if result: print(result)
