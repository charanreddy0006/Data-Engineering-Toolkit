from datetime import datetime, timezone

event_time = datetime(2026,9,24,10,0,tzinfo=timezone.utc)
processed = datetime(2026,9,24,10,0,2,tzinfo=timezone.utc)

print((processed-event_time).total_seconds())
