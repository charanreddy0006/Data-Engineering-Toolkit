from collections import defaultdict

counts = defaultdict(int)

def process(event):
    vehicle_id = event["vehicle_id"]
    counts[vehicle_id] += 1
    return vehicle_id, counts[vehicle_id]

for event in [{"vehicle_id":"V1"},{"vehicle_id":"V1"},{"vehicle_id":"V2"}]:
    print(process(event))
